import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../database/database_helper.dart';

class LawDetailPage extends StatefulWidget {
  final LawSection section;

  const LawDetailPage({super.key, required this.section});

  @override
  State<LawDetailPage> createState() => _LawDetailPageState();
}

class _LawDetailPageState extends State<LawDetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('§ ${widget.section.titleNumber}-${widget.section.sectionNumber}'),
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: _isFavorite ? Colors.amber[800] : null,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _isFavorite ? 'Added to favorites' : 'Removed from favorites',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              _shareSection();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card with Section Info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber[100]!,
                    Colors.amber[50]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.amber[300]!,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Reference Number
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber[800],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '§ ${widget.section.titleNumber}-${widget.section.sectionNumber}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Section Title
                  Text(
                    widget.section.sectionTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[900],
                          height: 1.3,
                        ),
                  ),
                  const SizedBox(height: 12),
                  // Title and Chapter Info
                  Row(
                    children: [
                      Icon(Icons.book, size: 16, color: Colors.amber[700]),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Title ${widget.section.titleNumber}: ${widget.section.titleName}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.amber[900],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.menu_book, size: 16, color: Colors.amber[700]),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Chapter ${widget.section.chapterNumber}: ${widget.section.chapterName}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.amber[900],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Section Text Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Full Text" Header
                  Row(
                    children: [
                      Icon(Icons.article, color: Colors.grey[700], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Full Text',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Section Text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: SelectableText(
                      widget.section.sectionText,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15,
                            height: 1.7,
                            color: Colors.black87,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  // Notes Section (if available)
                  if (widget.section.notes != null &&
                      widget.section.notes!.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.amber[800], size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Notes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber[200]!),
                      ),
                      child: SelectableText(
                        widget.section.notes!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              height: 1.6,
                              color: Colors.amber[900],
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],

                  // Metadata Section
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.info, color: Colors.grey[600], size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(
                    'Title Number',
                    widget.section.titleNumber,
                    Icons.tag,
                  ),
                  _buildInfoRow(
                    'Chapter Number',
                    widget.section.chapterNumber,
                    Icons.format_list_numbered,
                  ),
                  _buildInfoRow(
                    'Section Number',
                    widget.section.sectionNumber,
                    Icons.numbers,
                  ),
                  if (widget.section.subtitle != null)
                    _buildInfoRow(
                      'Subtitle',
                      widget.section.subtitle!,
                      Icons.subtitles,
                    ),
                  if (widget.section.lastUpdated != null)
                    _buildInfoRow(
                      'Last Updated',
                      '${widget.section.lastUpdated!.year}-${widget.section.lastUpdated!.month.toString().padLeft(2, '0')}-${widget.section.lastUpdated!.day.toString().padLeft(2, '0')}',
                      Icons.calendar_today,
                    ),

                  // Bottom Action Buttons
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _copyToClipboard();
                          },
                          icon: const Icon(Icons.copy),
                          label: const Text('Copy Text'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _showCitation();
                          },
                          icon: const Icon(Icons.format_quote),
                          label: const Text('Citation'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.amber[700],
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard() {
    final text = '''
${widget.section.sectionTitle}
§ ${widget.section.titleNumber}-${widget.section.sectionNumber}

${widget.section.sectionText}
''';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✓ Copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareSection() {
    final text = '''
${widget.section.sectionTitle}
§ ${widget.section.titleNumber}-${widget.section.sectionNumber}

${widget.section.sectionText}

Source: United States Code
''';
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✓ Text copied - ready to share'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showCitation() {
    final citation = '${widget.section.titleNumber} U.S.C. § ${widget.section.sectionNumber}';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Legal Citation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Standard Citation:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectableText(
              citation,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Full Title: ${widget.section.sectionTitle}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: citation));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('✓ Citation copied'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Copy Citation'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
