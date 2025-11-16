import 'dart:async';
import 'package:flutter/material.dart';
import '../models/dmv_question.dart';
import '../data/dmv_test_data.dart';
import '../database/database_helper.dart';

class DmvQuizPage extends StatefulWidget {
  final String category;

  const DmvQuizPage({super.key, required this.category});

  @override
  State<DmvQuizPage> createState() => _DmvQuizPageState();
}

class _DmvQuizPageState extends State<DmvQuizPage> {
  final DatabaseHelper _db = DatabaseHelper();
  List<DmvQuestion> _questions = [];
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;
  bool _showExplanation = false;
  int _correctAnswers = 0;
  bool _quizCompleted = false;
  Timer? _timer;
  int _secondsElapsed = 0;
  List<List<Map<String, String>>> _shuffledAnswersList = []; // Pre-shuffled answers for each question

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _secondsElapsed++);
    });
  }

  Future<void> _loadQuestions() async {
    var questions = widget.category == 'all' 
        ? DmvTestData.getAllQuestions()
        : DmvTestData.getQuestionsByCategory(widget.category);
    
    // Only shuffle if "all" category (mixed)
    if (widget.category == 'all') {
      questions.shuffle();
    }
    
    // Limit to 10 questions
    if (questions.length > 10) {
      questions = questions.sublist(0, 10);
    }
    
    // Pre-shuffle answers for each question to prevent them from changing
    _shuffledAnswersList = questions.map((q) {
      final answers = [
        {'label': 'A', 'text': q.optionA},
        {'label': 'B', 'text': q.optionB},
        {'label': 'C', 'text': q.optionC},
        {'label': 'D', 'text': q.optionD},
      ];
      answers.shuffle();
      return answers;
    }).toList();
    
    setState(() => _questions = questions);
  }

  void _selectAnswer(String answer) {
    if (_showExplanation) return;
    setState(() {
      _selectedAnswer = answer;
      _showExplanation = true;
      if (answer == _currentQuestion.correctAnswer) {
        _correctAnswers++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
        _showExplanation = false;
      });
    } else {
      _completeQuiz();
    }
  }

  List<Map<String, String>> _getCurrentShuffledAnswers() {
    // Return pre-shuffled answers for current question
    return _shuffledAnswersList[_currentQuestionIndex];
  }

  Future<void> _completeQuiz() async {
    _timer?.cancel();
    
    final percentage = (_correctAnswers / _questions.length) * 100;
    final result = QuizResult(
      dateTaken: DateTime.now(),
      category: widget.category,
      totalQuestions: _questions.length,
      correctAnswers: _correctAnswers,
      percentage: percentage,
      durationSeconds: _secondsElapsed,
    );

    await _db.insertQuizResult(result.toMap());

    setState(() => _quizCompleted = true);
  }

  DmvQuestion get _currentQuestion => _questions[_currentQuestionIndex];

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(DmvTestData.getCategoryName(widget.category)),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_quizCompleted) {
      return _buildResultsScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category == 'all' ? 'All Categories (Mixed)' : DmvTestData.getCategoryName(widget.category)),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                _formatTime(_secondsElapsed),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / _questions.length,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
          ),
          
          // Question counter
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Score: $_correctAnswers/${_currentQuestionIndex + (_showExplanation ? 1 : 0)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
          ),

          // Question and answers
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Question
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        _currentQuestion.question,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Answer options (shuffled)
                  ..._getCurrentShuffledAnswers().map((answer) => 
                    _buildAnswerOption(answer['label']!, answer['text']!)
                  ),

                  // Explanation
                  if (_showExplanation) ...[
                    const SizedBox(height: 20),
                    Card(
                      color: _selectedAnswer == _currentQuestion.correctAnswer
                          ? Colors.green[50]
                          : Colors.red[50],
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  _selectedAnswer == _currentQuestion.correctAnswer
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color: _selectedAnswer == _currentQuestion.correctAnswer
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _selectedAnswer == _currentQuestion.correctAnswer
                                      ? 'Correct!'
                                      : 'Incorrect',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedAnswer == _currentQuestion.correctAnswer
                                        ? Colors.green[900]
                                        : Colors.red[900],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Explanation:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _currentQuestion.explanation,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Next button
          if (_showExplanation)
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    _currentQuestionIndex < _questions.length - 1
                        ? 'Next Question'
                        : 'Finish Quiz',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(String letter, String text) {
    final isSelected = _selectedAnswer == letter;
    final isCorrect = letter == _currentQuestion.correctAnswer;
    
    Color? backgroundColor;
    Color? borderColor;
    
    if (_showExplanation) {
      if (isCorrect) {
        backgroundColor = Colors.green[50];
        borderColor = Colors.green;
      } else if (isSelected && !isCorrect) {
        backgroundColor = Colors.red[50];
        borderColor = Colors.red;
      }
    } else if (isSelected) {
      backgroundColor = Colors.blue[50];
      borderColor = Colors.blue[700];
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: borderColor ?? Colors.grey[300]!,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: _showExplanation ? null : () => _selectAnswer(letter),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: borderColor ?? Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    letter,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (_showExplanation && isCorrect)
                const Icon(Icons.check_circle, color: Colors.green),
              if (_showExplanation && isSelected && !isCorrect)
                const Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultsScreen() {
    final percentage = (_correctAnswers / _questions.length) * 100;
    final passed = percentage >= 70;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                passed ? Icons.check_circle : Icons.cancel,
                size: 100,
                color: passed ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                passed ? 'Congratulations!' : 'Keep Practicing!',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: passed ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$_correctAnswers out of ${_questions.length} correct',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Time: ${_formatTime(_secondsElapsed)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                passed
                    ? 'You passed! You\'re ready for the real test.'
                    : 'You need 70% or higher to pass. Try again!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Back to Categories'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentQuestionIndex = 0;
                          _selectedAnswer = null;
                          _showExplanation = false;
                          _correctAnswers = 0;
                          _quizCompleted = false;
                          _secondsElapsed = 0;
                          _loadQuestions();
                          _startTimer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Try Again'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
