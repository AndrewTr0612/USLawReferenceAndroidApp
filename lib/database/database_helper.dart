import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LegalTerm {
  final int? id;
  final String term;
  final String definition;
  final String? uscode;

  LegalTerm({
    this.id,
    required this.term,
    required this.definition,
    this.uscode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'term': term,
      'definition': definition,
      'uscode': uscode,
    };
  }

  factory LegalTerm.fromMap(Map<String, dynamic> map) {
    return LegalTerm(
      id: map['id'],
      term: map['term'],
      definition: map['definition'],
      uscode: map['uscode'],
    );
  }
}

class LawSection {
  final int? id;
  final String titleNumber; // e.g., "1", "2", "3"
  final String titleName; // e.g., "General Provisions"
  final String? subtitle; // e.g., "Part I"
  final String chapterNumber;
  final String chapterName;
  final String sectionNumber; // e.g., "101"
  final String sectionTitle;
  final String sectionText;
  final String? notes;
  final DateTime? lastUpdated;

  LawSection({
    this.id,
    required this.titleNumber,
    required this.titleName,
    this.subtitle,
    required this.chapterNumber,
    required this.chapterName,
    required this.sectionNumber,
    required this.sectionTitle,
    required this.sectionText,
    this.notes,
    this.lastUpdated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titleNumber': titleNumber,
      'titleName': titleName,
      'subtitle': subtitle,
      'chapterNumber': chapterNumber,
      'chapterName': chapterName,
      'sectionNumber': sectionNumber,
      'sectionTitle': sectionTitle,
      'sectionText': sectionText,
      'notes': notes,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  factory LawSection.fromMap(Map<String, dynamic> map) {
    return LawSection(
      id: map['id'],
      titleNumber: map['titleNumber'],
      titleName: map['titleName'],
      subtitle: map['subtitle'],
      chapterNumber: map['chapterNumber'],
      chapterName: map['chapterName'],
      sectionNumber: map['sectionNumber'],
      sectionTitle: map['sectionTitle'],
      sectionText: map['sectionText'],
      notes: map['notes'],
      lastUpdated:
          map['lastUpdated'] != null ? DateTime.parse(map['lastUpdated']) : null,
    );
  }
}

class DatabaseHelper {
  static const String dbName = 'law_glossary.db';
  static const String termsTable = 'legal_terms';
  static const String sectionsTable = 'law_sections';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        // Legal terms table
        await db.execute('''
          CREATE TABLE $termsTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            term TEXT UNIQUE NOT NULL,
            definition TEXT NOT NULL,
            uscode TEXT
          )
        ''');

        // Law sections table
        await db.execute('''
          CREATE TABLE $sectionsTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titleNumber TEXT NOT NULL,
            titleName TEXT NOT NULL,
            subtitle TEXT,
            chapterNumber TEXT NOT NULL,
            chapterName TEXT NOT NULL,
            sectionNumber TEXT NOT NULL,
            sectionTitle TEXT NOT NULL,
            sectionText TEXT NOT NULL,
            notes TEXT,
            lastUpdated TEXT,
            UNIQUE(titleNumber, chapterNumber, sectionNumber)
          )
        ''');

        // DMV questions table
        await db.execute('''
          CREATE TABLE dmv_questions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category TEXT NOT NULL,
            question TEXT NOT NULL,
            optionA TEXT NOT NULL,
            optionB TEXT NOT NULL,
            optionC TEXT NOT NULL,
            optionD TEXT NOT NULL,
            correctAnswer TEXT NOT NULL,
            explanation TEXT NOT NULL,
            imageUrl TEXT
          )
        ''');

        // Quiz results table
        await db.execute('''
          CREATE TABLE quiz_results(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            dateTaken TEXT NOT NULL,
            category TEXT NOT NULL,
            totalQuestions INTEGER NOT NULL,
            correctAnswers INTEGER NOT NULL,
            percentage REAL NOT NULL,
            durationSeconds INTEGER NOT NULL
          )
        ''');

        // Create indexes for faster searching
        await db.execute(
            'CREATE INDEX idx_section_number ON $sectionsTable(sectionNumber)');
        await db.execute(
            'CREATE INDEX idx_title_number ON $sectionsTable(titleNumber)');
        await db.execute(
            'CREATE INDEX idx_chapter_number ON $sectionsTable(chapterNumber)');
        await db.execute(
            'CREATE INDEX idx_dmv_category ON dmv_questions(category)');
        await db.execute(
            'CREATE INDEX idx_quiz_date ON quiz_results(dateTaken)');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Create law sections table if upgrading
          await db.execute('''
            CREATE TABLE IF NOT EXISTS $sectionsTable(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              titleNumber TEXT NOT NULL,
              titleName TEXT NOT NULL,
              subtitle TEXT,
              chapterNumber TEXT NOT NULL,
              chapterName TEXT NOT NULL,
              sectionNumber TEXT NOT NULL,
              sectionTitle TEXT NOT NULL,
              sectionText TEXT NOT NULL,
              notes TEXT,
              lastUpdated TEXT,
              UNIQUE(titleNumber, chapterNumber, sectionNumber)
            )
          ''');
        }
        if (oldVersion < 3) {
          // Create DMV tables if upgrading
          await db.execute('''
            CREATE TABLE IF NOT EXISTS dmv_questions(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              category TEXT NOT NULL,
              question TEXT NOT NULL,
              optionA TEXT NOT NULL,
              optionB TEXT NOT NULL,
              optionC TEXT NOT NULL,
              optionD TEXT NOT NULL,
              correctAnswer TEXT NOT NULL,
              explanation TEXT NOT NULL,
              imageUrl TEXT
            )
          ''');
          await db.execute('''
            CREATE TABLE IF NOT EXISTS quiz_results(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              dateTaken TEXT NOT NULL,
              category TEXT NOT NULL,
              totalQuestions INTEGER NOT NULL,
              correctAnswers INTEGER NOT NULL,
              percentage REAL NOT NULL,
              durationSeconds INTEGER NOT NULL
            )
          ''');
          await db.execute(
              'CREATE INDEX IF NOT EXISTS idx_dmv_category ON dmv_questions(category)');
          await db.execute(
              'CREATE INDEX IF NOT EXISTS idx_quiz_date ON quiz_results(dateTaken)');
        }
      },
    );
  }

  Future<void> insertTerm(LegalTerm term) async {
    final db = await database;
    try {
      await db.insert(
        termsTable,
        term.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
    }
  }

  Future<void> insertTerms(List<LegalTerm> terms) async {
    final db = await database;
    for (var term in terms) {
      try {
        await db.insert(
          termsTable,
          term.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } catch (e) {
      }
    }
  }

  Future<void> insertSection(LawSection section) async {
    final db = await database;
    try {
      await db.insert(
        sectionsTable,
        section.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
    }
  }

  Future<void> insertSections(List<LawSection> sections) async {
    final db = await database;
    for (var section in sections) {
      try {
        await db.insert(
          sectionsTable,
          section.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } catch (e) {
      }
    }
  }

  Future<List<LegalTerm>> getAllTerms() async {
    final db = await database;
    final maps = await db.query(termsTable);
    return List.generate(maps.length, (i) => LegalTerm.fromMap(maps[i]));
  }

  Future<List<LawSection>> getAllSections() async {
    final db = await database;
    final maps = await db.query(sectionsTable);
    return List.generate(maps.length, (i) => LawSection.fromMap(maps[i]));
  }

  Future<List<LawSection>> getSectionsByTitle(String titleNumber) async {
    final db = await database;
    final maps = await db.query(
      sectionsTable,
      where: 'titleNumber = ?',
      whereArgs: [titleNumber],
    );
    return List.generate(maps.length, (i) => LawSection.fromMap(maps[i]));
  }

  Future<List<LawSection>> getSectionsByChapter(
      String titleNumber, String chapterNumber) async {
    final db = await database;
    final maps = await db.query(
      sectionsTable,
      where: 'titleNumber = ? AND chapterNumber = ?',
      whereArgs: [titleNumber, chapterNumber],
    );
    return List.generate(maps.length, (i) => LawSection.fromMap(maps[i]));
  }

  Future<LegalTerm?> searchTerm(String term) async {
    final db = await database;
    final maps = await db.query(
      termsTable,
      where: 'term LIKE ?',
      whereArgs: ['%$term%'],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return LegalTerm.fromMap(maps.first);
    }
    return null;
  }

  Future<List<LegalTerm>> searchTerms(String query) async {
    final db = await database;
    final maps = await db.query(
      termsTable,
      where: 'term LIKE ? OR definition LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );

    return List.generate(maps.length, (i) => LegalTerm.fromMap(maps[i]));
  }

  Future<List<LawSection>> searchSections(String query) async {
    final db = await database;
    final maps = await db.query(
      sectionsTable,
      where:
          'sectionTitle LIKE ? OR sectionText LIKE ? OR sectionNumber LIKE ?',
      whereArgs: ['%$query%', '%$query%', '%$query%'],
    );

    return List.generate(maps.length, (i) => LawSection.fromMap(maps[i]));
  }

  Future<int> getTermCount() async {
    final db = await database;
    final result =
        await db.rawQuery('SELECT COUNT(*) as count FROM $termsTable');
    return int.parse(result.first['count'].toString());
  }

  Future<int> getSectionCount() async {
    final db = await database;
    final result =
        await db.rawQuery('SELECT COUNT(*) as count FROM $sectionsTable');
    return int.parse(result.first['count'].toString());
  }

  Future<void> deleteTerm(int id) async {
    final db = await database;
    await db.delete(termsTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteSection(int id) async {
    final db = await database;
    await db.delete(sectionsTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearAllTerms() async {
    final db = await database;
    await db.delete(termsTable);
  }

  Future<void> clearAllSections() async {
    final db = await database;
    await db.delete(sectionsTable);
  }

  // DMV Questions methods
  Future<void> insertDmvQuestion(Map<String, dynamic> question) async {
    final db = await database;
    try {
      await db.insert(
        'dmv_questions',
        question,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
    }
  }

  Future<void> insertDmvQuestions(List<Map<String, dynamic>> questions) async {
    final db = await database;
    for (var question in questions) {
      try {
        await db.insert(
          'dmv_questions',
          question,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      } catch (e) {
      }
    }
  }

  Future<List<Map<String, dynamic>>> getAllDmvQuestions() async {
    final db = await database;
    return await db.query('dmv_questions');
  }

  Future<List<Map<String, dynamic>>> getDmvQuestionsByCategory(String category) async {
    final db = await database;
    return await db.query(
      'dmv_questions',
      where: 'category = ?',
      whereArgs: [category],
    );
  }

  Future<int> getDmvQuestionCount() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM dmv_questions');
    return int.parse(result.first['count'].toString());
  }

  Future<void> clearDmvQuestions() async {
    final db = await database;
    await db.delete('dmv_questions');
  }

  // Quiz Results methods
  Future<void> insertQuizResult(Map<String, dynamic> result) async {
    final db = await database;
    try {
      await db.insert(
        'quiz_results',
        result,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
    }
  }

  Future<List<Map<String, dynamic>>> getAllQuizResults() async {
    final db = await database;
    return await db.query(
      'quiz_results',
      orderBy: 'dateTaken DESC',
    );
  }

  Future<List<Map<String, dynamic>>> getQuizResultsByCategory(String category) async {
    final db = await database;
    return await db.query(
      'quiz_results',
      where: 'category = ?',
      whereArgs: [category],
      orderBy: 'dateTaken DESC',
    );
  }

  Future<void> clearQuizResults() async {
    final db = await database;
    await db.delete('quiz_results');
  }
}
