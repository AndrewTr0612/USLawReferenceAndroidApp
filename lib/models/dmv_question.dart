class DmvQuestion {
  final int? id;
  final String category; // 'signs', 'rules', 'safety', 'parking', 'signals'
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer; // 'A', 'B', 'C', or 'D'
  final String explanation;
  final String? imageUrl; // Optional image for sign questions

  DmvQuestion({
    this.id,
    required this.category,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
    required this.explanation,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'question': question,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correctAnswer': correctAnswer,
      'explanation': explanation,
      'imageUrl': imageUrl,
    };
  }

  factory DmvQuestion.fromMap(Map<String, dynamic> map) {
    return DmvQuestion(
      id: map['id'],
      category: map['category'],
      question: map['question'],
      optionA: map['optionA'],
      optionB: map['optionB'],
      optionC: map['optionC'],
      optionD: map['optionD'],
      correctAnswer: map['correctAnswer'],
      explanation: map['explanation'],
      imageUrl: map['imageUrl'],
    );
  }
}

class QuizResult {
  final int? id;
  final DateTime dateTaken;
  final String category;
  final int totalQuestions;
  final int correctAnswers;
  final double percentage;
  final int durationSeconds;

  QuizResult({
    this.id,
    required this.dateTaken,
    required this.category,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.percentage,
    required this.durationSeconds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateTaken': dateTaken.toIso8601String(),
      'category': category,
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'percentage': percentage,
      'durationSeconds': durationSeconds,
    };
  }

  factory QuizResult.fromMap(Map<String, dynamic> map) {
    return QuizResult(
      id: map['id'],
      dateTaken: DateTime.parse(map['dateTaken']),
      category: map['category'],
      totalQuestions: map['totalQuestions'],
      correctAnswers: map['correctAnswers'],
      percentage: map['percentage'],
      durationSeconds: map['durationSeconds'],
    );
  }
}
