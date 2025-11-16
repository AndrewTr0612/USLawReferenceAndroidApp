import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import '../database/database_helper.dart';

class BulkDataService {
  static const String govInfoBaseUrl = 'https://www.govinfo.gov/bulkdata/USCODE';
  
  /// Download and parse a specific title from GovInfo
  static Future<List<LawSection>> downloadTitle(String titleNumber) async {
    try {
      
      // GovInfo URL pattern for individual titles
      // Example: https://www.govinfo.gov/bulkdata/USCODE/2023/title-1/USCODE-2023-title1.xml
      final year = DateTime.now().year;
      final url = '$govInfoBaseUrl/$year/title-$titleNumber/USCODE-$year-title$titleNumber.xml';
      
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        },
      ).timeout(
        const Duration(minutes: 5),
        onTimeout: () => throw Exception('Download timeout'),
      );

      if (response.statusCode == 200) {
        return _parseXml(response.body, titleNumber);
      } else {
        throw Exception('Failed to download: HTTP ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Parse USC XML and extract sections
  static List<LawSection> _parseXml(String xmlContent, String titleNumber) {
    try {
      final document = xml.XmlDocument.parse(xmlContent);
      final sections = <LawSection>[];

      // Find title name
      final titleElement = document.findAllElements('title').first;
      final titleName = titleElement.getAttribute('name') ?? 'Unknown Title';

      // Find all sections
      final sectionElements = document.findAllElements('section');
      
      for (var sectionElement in sectionElements) {
        try {
          final sectionNum = sectionElement.getAttribute('num') ?? 
                            sectionElement.getAttribute('identifier') ?? '0';
          final heading = sectionElement.findElements('heading').first.text.trim();
          
          // Get section text (combine all content elements)
          final contentElements = sectionElement.findElements('content');
          final textBuffer = StringBuffer();
          
          for (var content in contentElements) {
            textBuffer.writeln(content.text.trim());
          }
          
          // Get notes if available
          final notesElements = sectionElement.findElements('notes');
          String? notes;
          if (notesElements.isNotEmpty) {
            notes = notesElements.first.text.trim();
          }

          // Find chapter information
          final chapter = sectionElement.parent?.getAttribute('num') ?? '1';
          final chapterName = sectionElement.parent?.getAttribute('name') ?? 'General';

          sections.add(
            LawSection(
              titleNumber: titleNumber,
              titleName: titleName,
              chapterNumber: chapter,
              chapterName: chapterName,
              sectionNumber: sectionNum,
              sectionTitle: heading,
              sectionText: textBuffer.toString(),
              notes: notes,
              lastUpdated: DateTime.now(),
            ),
          );
        } catch (e) {
          continue;
        }
      }

      return sections;
    } catch (e) {
      return [];
    }
  }

  /// Download and sync all common titles
  static Future<void> syncCommonTitles(
    DatabaseHelper db,
    Function(String title, int current, int total) onProgress,
  ) async {
    final commonTitles = [
      '1',   // General Provisions
      '5',   // Government Organization
      '10',  // Armed Forces
      '15',  // Commerce and Trade
      '18',  // Crimes and Criminal Procedure
      '26',  // Internal Revenue Code
      '28',  // Judiciary
      '29',  // Labor
      '42',  // Public Health and Welfare
    ];

    for (var i = 0; i < commonTitles.length; i++) {
      final title = commonTitles[i];
      try {
        onProgress('Title $title', i + 1, commonTitles.length);
        
        final sections = await downloadTitle(title);
        if (sections.isNotEmpty) {
          await db.insertSections(sections);
        }
      } catch (e) {
        // Continue with next title even if one fails
        continue;
      }
    }
  }

  /// Download all 54 titles (complete US Code)
  static Future<void> syncAllTitles(
    DatabaseHelper db,
    Function(String title, int current, int total) onProgress,
  ) async {
    // All 54 titles of the US Code
    final allTitles = List.generate(54, (index) => '${index + 1}');

    for (var i = 0; i < allTitles.length; i++) {
      final title = allTitles[i];
      try {
        onProgress('Title $title', i + 1, allTitles.length);
        
        final sections = await downloadTitle(title);
        if (sections.isNotEmpty) {
          await db.insertSections(sections);
        }
      } catch (e) {
        // Continue with next title
        continue;
      }
    }
  }

  /// Get list of available titles from GovInfo
  static Future<List<String>> getAvailableTitles() async {
    try {
      final year = DateTime.now().year;
      final url = '$govInfoBaseUrl/$year';
      
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        // Parse HTML to extract title numbers
        // This is a simplified version - you may need to parse the directory listing
        final titles = <String>[];
        for (var i = 1; i <= 54; i++) {
          titles.add('$i');
        }
        return titles;
      }
      
      return [];
    } catch (e) {
      return [];
    }
  }
}
