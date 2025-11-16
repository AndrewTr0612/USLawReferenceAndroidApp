import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html_parser;
import '../database/database_helper.dart';

class UscodeService {
  static const String baseUrl = 'https://uscode.house.gov';
  static const String browseUrl = '$baseUrl/browse.xhtml';

  /// Fetch and parse all law sections from USC House
  static Future<List<LawSection>> fetchAllLawSections() async {
    try {
      final response = await http.get(
        Uri.parse(browseUrl),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      ).timeout(
        const Duration(seconds: 60),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      if (response.statusCode == 200) {
        return _parseSections(response.body);
      } else {
        throw Exception('Failed to fetch: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Parse HTML and extract law sections
  static List<LawSection> _parseSections(String html) {
    try {
      var document = html_parser.parse(html);
      List<LawSection> sections = [];

      // The USC House browse page is JavaScript-based
      // This is a fallback parser - it may need adjustment based on actual HTML structure
      
      var contentAreas = document.querySelectorAll('[id^="content"], .content, main, article');
      
      for (var area in contentAreas) {
        // Look for title information
        var titles = area.querySelectorAll('h1, h2, [class*="title"]');
        
        for (var titleElement in titles) {
          String titleText = titleElement.text.trim();
          
          // Extract patterns like "Title 1 — General Provisions"
          var titleMatch = RegExp(r'Title\s+(\d+)\s*[—\-]?\s*(.+)').firstMatch(titleText);
          
          if (titleMatch != null) {
            String titleNumber = titleMatch.group(1) ?? '0';
            String titleName = titleMatch.group(2) ?? 'Unknown';

            // Look for sections under this title
            var parent = titleElement.parent;
            if (parent != null) {
              var siblingElements = parent.children;
              var titleIndex = siblingElements.indexOf(titleElement);

              // Parse sections that follow
              for (int i = titleIndex + 1; i < siblingElements.length; i++) {
                var section = _parseSection(
                  siblingElements[i],
                  titleNumber,
                  titleName,
                );
                if (section != null) {
                  sections.add(section);
                }
              }
            }
          }
        }
      }

      return sections;
    } catch (e) {
      return [];
    }
  }

  /// Parse individual section element
  static LawSection? _parseSection(
    var element,
    String titleNumber,
    String titleName,
  ) {
    try {
      String elementText = element.text.trim();
      
      // Pattern: § 101. Section Title
      var sectionMatch = RegExp(r'§?\s*(\d+)\.\s*(.+?)(?:\n|$)').firstMatch(elementText);
      
      if (sectionMatch != null) {
        String sectionNumber = sectionMatch.group(1) ?? '0';
        String sectionTitle = sectionMatch.group(2) ?? 'Untitled';

        return LawSection(
          titleNumber: titleNumber,
          titleName: titleName,
          chapterNumber: '1', // Placeholder
          chapterName: 'General', // Placeholder
          sectionNumber: sectionNumber,
          sectionTitle: sectionTitle,
          sectionText: elementText,
          lastUpdated: DateTime.now(),
        );
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Sync sections to database
  static Future<void> syncSectionsToDatabase() async {
    try {
      final sections = await fetchAllLawSections();
      final db = DatabaseHelper();

      if (sections.isNotEmpty) {
        await db.insertSections(sections);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch and parse legal terms (glossary)
  static Future<List<LegalTerm>> fetchLegalTerms() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/'),
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw TimeoutException('Request timeout'),
      );

      if (response.statusCode == 200) {
        return _parseTerms(response.body);
      } else {
        throw Exception('Failed to fetch: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Parse HTML and extract legal terms
  static List<LegalTerm> _parseTerms(String html) {
    try {
      var document = html_parser.parse(html);
      List<LegalTerm> terms = [];

      var sections = document.querySelectorAll('section, div.content, div.glossary');

      for (var section in sections) {
        var headings = section.querySelectorAll('h2, h3, dt, .term');
        var descriptions =
            section.querySelectorAll('p, dd, .definition, .description');

        for (var i = 0; i < headings.length && i < descriptions.length; i++) {
          String term = headings[i].text.trim();
          String definition = descriptions[i].text.trim();

          if (term.isNotEmpty && definition.isNotEmpty) {
            terms.add(
              LegalTerm(
                term: term,
                definition: definition,
                uscode: baseUrl,
              ),
            );
          }
        }
      }

      return terms;
    } catch (e) {
      return [];
    }
  }

  /// Fetch and store terms in local database
  static Future<void> syncTermsToDatabase() async {
    try {
      final terms = await fetchLegalTerms();
      final db = DatabaseHelper();

      if (terms.isNotEmpty) {
        await db.insertTerms(terms);
      }
    } catch (e) {
      rethrow;
    }
  }
}

class TimeoutException implements Exception {
  final String message;
  TimeoutException(this.message);

  @override
  String toString() => message;
}
