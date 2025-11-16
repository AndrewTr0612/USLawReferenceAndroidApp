import 'package:flutter/material.dart';
import '../data/dmv_test_data.dart';
import '../database/database_helper.dart';
import 'dmv_quiz_page.dart';
import 'dmv_results_page.dart';

class DmvHomePage extends StatefulWidget {
  const DmvHomePage({super.key});

  @override
  State<DmvHomePage> createState() => _DmvHomePageState();
}

class _DmvHomePageState extends State<DmvHomePage> {
  final DatabaseHelper _db = DatabaseHelper();
  bool _isLoading = false;
  int _totalQuestions = 0;

  @override
  void initState() {
    super.initState();
    _loadDmvData();
  }

  Future<void> _loadDmvData() async {
    setState(() => _isLoading = true);
    try {
      final count = await _db.getDmvQuestionCount();
      if (count == 0) {
        // Load DMV questions into database
        final questions = DmvTestData.getAllQuestions();
        await _db.insertDmvQuestions(
          questions.map((q) => q.toMap()).toList(),
        );
      }
      final newCount = await _db.getDmvQuestionCount();
      setState(() => _totalQuestions = newCount);
    } catch (e) {
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _startQuiz(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DmvQuizPage(category: category),
      ),
    );
  }

  void _viewResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DmvResultsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DMV Practice Test'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Header Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[700]!, Colors.blue[500]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.drive_eta,
                        size: 64,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'DMV Knowledge Test',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_totalQuestions practice questions',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Quiz Categories
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Text(
                        'Select a Category',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ..._buildCategoryCards(),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 8),
                      _buildResultsButton(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  List<Widget> _buildCategoryCards() {
    final categories = ['all', ...DmvTestData.getCategories()];
    return categories.map((category) {
      final name = category == 'all' ? 'All Categories (Mixed)' : DmvTestData.getCategoryName(category);
      final icon = category == 'all' ? '🎲' : DmvTestData.getCategoryIcon(category);
      final questions = category == 'all' ? DmvTestData.getAllQuestions() : DmvTestData.getQuestionsByCategory(category);
      
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        child: InkWell(
          onTap: () => _startQuiz(category),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${questions.length} questions',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildResultsButton() {
    return OutlinedButton.icon(
      onPressed: _viewResults,
      icon: const Icon(Icons.history),
      label: const Text('View Quiz History'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: Colors.blue[700]!),
        foregroundColor: Colors.blue[700],
      ),
    );
  }
}
