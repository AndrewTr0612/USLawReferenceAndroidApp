import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../data/comprehensive_law_data.dart';
import 'law_detail_page.dart';

class BrowseLawsPage extends StatefulWidget {
  const BrowseLawsPage({super.key});

  @override
  State<BrowseLawsPage> createState() => _BrowseLawsPageState();
}

class _BrowseLawsPageState extends State<BrowseLawsPage> {
  final DatabaseHelper _db = DatabaseHelper();
  List<LawSection> _allSections = [];
  List<LawSection> _filteredSections = [];
  List<String> _titles = [];
  String? _selectedTitle;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final sections = await _db.getAllSections();
      _titles = ComprehensiveLawData.getAllTitles();
      
      setState(() {
        _allSections = sections;
        _filteredSections = sections;
        if (_titles.isNotEmpty) {
          _selectedTitle = _titles.first;
          _filterByTitle(_titles.first);
        }
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _filterByTitle(String title) {
    setState(() {
      _selectedTitle = title;
      String titleNum = title.split(' ')[1];
      _filteredSections = _allSections
          .where((section) => section.titleNumber == titleNum)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Laws'),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              children: [
                // Left side: Table of Contents
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border: Border(
                      right: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Database Stats Header
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.amber[700],
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.book, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FutureBuilder<int>(
                                future: _db.getSectionCount(),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.hasData 
                                        ? '${snapshot.data} Sections' 
                                        : 'Loading...',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 1),
                      // Table of Contents List
                      Expanded(
                        child: ListView.builder(
                          itemCount: _titles.length,
                          itemBuilder: (context, index) {
                            final title = _titles[index];
                            final isSelected = _selectedTitle == title;
                            return Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.amber[100] : Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]!),
                                ),
                              ),
                              child: ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                selected: isSelected,
                                title: Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? Colors.amber[900] : Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: isSelected
                                    ? Icon(Icons.chevron_right, color: Colors.amber[900], size: 18)
                                    : null,
                                onTap: () => _filterByTitle(title),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Right side: Section List
                Expanded(
                  child: _filteredSections.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.menu_book, size: 64, color: Colors.grey[300]),
                              const SizedBox(height: 16),
                              Text(
                                _selectedTitle != null
                                    ? 'No sections found'
                                    : 'Select a title to view sections',
                                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: _filteredSections.length,
                          itemBuilder: (context, index) {
                            final section = _filteredSections[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ExpansionTile(
                                title: Text(
                                  '§ ${section.sectionNumber}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: Text(
                                  section.sectionTitle,
                                  style: const TextStyle(fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          section.sectionText,
                                          style: const TextStyle(fontSize: 13),
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 12),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LawDetailPage(section: section),
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.open_in_new, size: 16),
                                          label: const Text('View Full Text'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber[700],
                                            foregroundColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
