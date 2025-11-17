# US Law Reference 📚⚖️

A comprehensive mobile application for browsing US Code sections, the Constitution, and practicing DMV knowledge tests. Built with Flutter for Android devices.

## 📱 Try the App

**Download the latest APK:**
- [USLawReference_Final.apk](https://github.com/AndrewTr0612/USLawReferenceAndroidApp/releases) (47.8MB)

### Installation Instructions
1. Download the APK file to your Android device
2. Enable "Install from Unknown Sources" in your device settings:
   - Go to **Settings** → **Security** → Enable **Unknown Sources**
   - Or on newer Android versions: **Settings** → **Apps** → **Special Access** → **Install Unknown Apps** → Select your browser/file manager → Allow
3. Open the downloaded APK file
4. Tap **Install** and wait for installation to complete
5. Open the app and start exploring US laws!

## ✨ Features

### 📖 Browse US Code
- **38 Titles** with real legal content from the United States Code
- Covers essential topics including:
  - General Provisions, Congress, The President
  - Criminal Law, Civil Rights, Immigration
  - Tax Code, Patents, Copyrights
  - Labor Law, Education, Veterans Benefits
  - And many more!
- Beautiful card-based interface with detailed section views
- Search functionality to quickly find specific laws
- Copy and share legal text
- Professional citation formatting

### 🏛️ US Constitution
- Complete text of the Constitution
- Bill of Rights and all Amendments
- Easy-to-read formatting with historical context

### 🚗 DMV Practice Test
- **50+ practice questions** across 5 categories:
  - Traffic Signs
  - Road Rules
  - Safety Regulations
  - Parking Rules
  - Traffic Signals
- **"All Categories (Mixed)"** mode for comprehensive practice
- 10 questions per quiz
- Timer tracking
- Detailed explanations for each answer
- Quiz history with performance statistics
- Track your progress over time

## 🎨 User Interface

- **Modern Material Design 3** with gradient themes
- **Card-based navigation** for intuitive browsing
- **Dark/Light mode compatible**
- Smooth animations and transitions
- Responsive layout for all screen sizes

## 🛠️ Technical Details

### Built With
- **Flutter** ^3.10.0
- **Dart** for business logic
- **SQLite** (sqflite ^2.3.0) for local data storage
- **Material Design 3** for UI components

### Database
- Efficient local SQLite database
- Three main tables:
  - `law_sections` - US Code and Constitutional content
  - `dmv_questions` - Practice test questions
  - `quiz_results` - User quiz history and scores

### Architecture
- Clean MVVM pattern
- Separation of concerns (data, models, pages, services)
- Stateful widgets for interactive components
- Database helper for data management

## 📊 Content Statistics

- **80+ Law Sections** from US Code
- **13 Constitutional Sections** (Preamble + Bill of Rights)
- **50+ DMV Questions** with explanations
- **38 US Code Titles** with actual legal text
- All content included offline - no internet required!

## 🚀 Features Highlights

### Law Detail Pages
- Full legal text with proper formatting
- Section metadata (title, chapter, section numbers)
- Historical notes and context
- Citation generator
- Copy to clipboard functionality
- Share functionality

### DMV Quiz System
- Randomized questions (Mixed mode only)
- Pre-shuffled answers to prevent display bugs
- Real-time scoring
- Performance tracking
- Quiz duration tracking
- Detailed explanations after each question

### Search & Browse
- Fast search across all law sections
- Filter by title, chapter, or keywords
- Table of Contents for easy navigation
- Expandable section cards

## 📄 License

This project is for educational purposes. Legal content is sourced from publicly available US government documents.

## 👨‍💻 Developer

Created by Andrew Tr
- GitHub: [@AndrewTr0612](https://github.com/AndrewTr0612)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/AndrewTr0612/USLawReferenceAndroidApp/issues).

## 📝 Changelog

### Version 1.0 (Current)
- ✅ 38 US Code titles with real content
- ✅ Complete Constitution and Bill of Rights
- ✅ 50+ DMV practice questions
- ✅ Quiz history and statistics
- ✅ Modern card-based UI
- ✅ Search and browse functionality
- ✅ Offline access to all content
- ✅ Fixed quiz randomization bugs
- ✅ Limited quizzes to 10 questions each

## � Submission Requirements

### Project Description
**US Law Reference** is a comprehensive mobile application designed to make US legal information accessible to everyone. Built with Flutter for Android devices, this app serves as a portable legal reference guide that combines the United States Code, the Constitution, and practical DMV test preparation in one convenient package.

The motivation behind this project stems from the need to democratize access to legal information. Legal texts are often difficult to navigate, scattered across multiple government websites, and not optimized for mobile viewing. This app solves these problems by providing offline access to carefully curated legal content in a modern, user-friendly interface.

Key accomplishments include implementing a robust SQLite database containing 80+ law sections across 38 US Code titles, creating an interactive quiz system with 50+ DMV practice questions, and designing an intuitive card-based navigation system. The app features advanced functionality such as real-time search, citation generation, quiz performance tracking, and the ability to copy and share legal text.

The technical implementation demonstrates proficiency in mobile app development, database management, state management in Flutter, and creating responsive, accessible user interfaces. The app successfully bridges the gap between complex legal documentation and everyday users who need quick, reliable access to legal information on their mobile devices.

This project showcases the power of mobile technology in making essential civic information more accessible while maintaining accuracy and usability. Whether someone needs to reference a specific law, study for their DMV test, or review constitutional rights, this app provides a comprehensive solution that works entirely offline.

### GitHub Repository
🔗 [https://github.com/AndrewTr0612/USLawReferenceAndroidApp](https://github.com/AndrewTr0612/USLawReferenceAndroidApp)

### Team Members
- **Andrew Tr** - Solo Developer
  - Full-stack mobile development
  - UI/UX design
  - Database architecture
  - Content curation and integration

### AI Tools Disclosure
This project utilized **GitHub Copilot**, **Chat GPT** as an AI-assisted development tool in the following ways:

**Code Generation & Implementation:**
- Assisted in generating Flutter widget structures and boilerplate code
- Helped implement SQLite database operations and queries
- Provided suggestions for state management patterns and best practices
- Generated helper functions for data formatting and transformations

**Problem Solving:**
- Aided in debugging compilation errors and runtime issues
- Suggested solutions for performance optimization
- Helped resolve dependency conflicts and version compatibility issues
- Provided alternative approaches to implementation challenges

**Documentation:**
- Assisted in writing code comments and documentation
- Helped structure the README file with comprehensive project information
- Generated documentation for complex functions and classes

**Content Structuring:**
- Helped organize and format legal text data for database insertion
- Assisted in structuring the DMV question database schema
- Provided guidance on data modeling for law sections

**Important Notes:**
- All legal content was manually curated from official US government sources
- Core application architecture and design decisions were human-directed
- AI suggestions were reviewed, modified, and validated before implementation
- Final code quality, logic, and functionality were verified through manual testing
- The AI served as a coding assistant, not as the primary developer

The use of GitHub Copilot significantly accelerated development time and helped maintain code quality, but all critical decisions, architecture design, and content accuracy verification were performed by the human developer.

## �📧 Support

For questions or support, please open an issue on GitHub or contact the developer.

---

**Note:** This app is designed for educational and reference purposes only. For official legal advice, please consult a licensed attorney.
