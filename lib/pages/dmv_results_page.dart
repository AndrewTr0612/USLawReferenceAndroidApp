import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../data/dmv_test_data.dart';
import 'package:intl/intl.dart';

class DmvResultsPage extends StatefulWidget {
  const DmvResultsPage({super.key});

  @override
  State<DmvResultsPage> createState() => _DmvResultsPageState();
}

class _DmvResultsPageState extends State<DmvResultsPage> {
  final DatabaseHelper _db = DatabaseHelper();
  List<Map<String, dynamic>> _results = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    setState(() => _isLoading = true);
    try {
      final results = await _db.getAllQuizResults();
      setState(() {
        _results = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes}m ${secs}s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz History'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          if (_results.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () => _confirmClearHistory(),
              tooltip: 'Clear History',
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _results.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No quiz history yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Take a quiz to see your results here',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    // Stats Summary
                    _buildStatsSummary(),
                    const Divider(height: 1),
                    
                    // Results List
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _results.length,
                        itemBuilder: (context, index) {
                          return _buildResultCard(_results[index]);
                        },
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildStatsSummary() {
    if (_results.isEmpty) return const SizedBox.shrink();

    final totalQuizzes = _results.length;
    final totalQuestions = _results.fold<int>(
      0,
      (sum, r) => sum + (r['totalQuestions'] as int),
    );
    final totalCorrect = _results.fold<int>(
      0,
      (sum, r) => sum + (r['correctAnswers'] as int),
    );
    final avgPercentage = (totalCorrect / totalQuestions) * 100;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Quizzes', '$totalQuizzes', Icons.quiz),
          _buildStatItem('Questions', '$totalQuestions', Icons.question_answer),
          _buildStatItem(
            'Avg Score',
            '${avgPercentage.toStringAsFixed(1)}%',
            Icons.analytics,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue[700], size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard(Map<String, dynamic> result) {
    final dateTaken = DateTime.parse(result['dateTaken']);
    final category = result['category'] as String;
    final categoryName = DmvTestData.getCategoryName(category);
    final categoryIcon = DmvTestData.getCategoryIcon(category);
    final totalQuestions = result['totalQuestions'] as int;
    final correctAnswers = result['correctAnswers'] as int;
    final percentage = result['percentage'] as double;
    final durationSeconds = result['durationSeconds'] as int;
    final passed = percentage >= 70;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: passed ? Colors.green[50] : Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      categoryIcon,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('MMM d, y • h:mm a').format(dateTaken),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: passed ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    passed ? 'PASSED' : 'FAILED',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildResultDetail(
                    'Score',
                    '$correctAnswers/$totalQuestions',
                    Icons.check_circle_outline,
                  ),
                ),
                Expanded(
                  child: _buildResultDetail(
                    'Percentage',
                    '${percentage.toStringAsFixed(1)}%',
                    Icons.percent,
                  ),
                ),
                Expanded(
                  child: _buildResultDetail(
                    'Time',
                    _formatTime(durationSeconds),
                    Icons.timer_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultDetail(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Future<void> _confirmClearHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text(
          'Are you sure you want to delete all quiz history? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _db.clearQuizResults();
      _loadResults();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Quiz history cleared'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }
}
