import 'package:flutter/material.dart';
import 'database/database_helper.dart';
import 'data/comprehensive_law_data.dart';
import 'data/constitutional_data.dart';
import 'pages/card_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final db = DatabaseHelper();
    try {
      final count = await db.getSectionCount();
      if (count == 0) {
        final codeSections = ComprehensiveLawData.getComprehensiveSections();
        await db.insertSections(codeSections);
        
        final constitutionalSections = ConstitutionalData.getConstitutionalSections();
        await db.insertSections(constitutionalSections);
      }
    } catch (e) {
      // Silently handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'US Law Reference',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[800] ?? Colors.blue),
        useMaterial3: true,
      ),
      home: const CardHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
