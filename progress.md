# Cybersafety App - Development Progress

## Feature: AI Summarized Cybersecurity News

### Overview
Building a feature that fetches current cybersecurity events from a website, summarizes them using OpenAI, and allows users to click on summaries to visit the source website.

---

## Progress Tracker

### ✅ Completed Tasks

#### Task 1: Set up Flutter project structure and dependencies
- [x] Added Firebase packages (`firebase_core`, `cloud_firestore`)
- [x] Added HTTP client (`http`)
- [x] Added URL launcher (`url_launcher`)
- [x] Added state management (`flutter_bloc`, `bloc`)
- [x] Ran `flutter pub get` to install packages

---

### 🔄 In Progress

#### Task 2: Configure Firebase project and connect to Flutter app
- [x] Created Firebase project in Firebase Console
- [x] Registered Flutter app (Android/iOS) with package name `com.rutilo.cybersafetyapp`
- [x] Downloaded `google-services.json` (Android)
- [x] Downloaded `GoogleService-Info.plist` (iOS)
- [x] Added Firebase config files to project
- [x] Updated `.gitignore` to exclude Firebase config files
- [x] Updated Android Gradle files with Google services plugin
- [ ] Initialize Firebase in main.dart - **NEXT STEP**

**Resources:** [FlutterFire Documentation](https://firebase.flutter.dev/docs/overview)

**Current Status:** Ready to initialize Firebase in main.dart

---

### 📋 Upcoming Tasks

---

#### Task 3: Set up OpenAI API configuration and API key management
- [ ] Create OpenAI account and get API key
- [ ] Set up secure API key storage (environment variables)
- [ ] Learn about OpenAI Chat Completions API

**Resources:** [OpenAI Platform](https://platform.openai.com)

---

#### Task 4: Research and choose a cybersecurity news source/API
- [ ] Explore options:
  - NewsAPI.org
  - RSS feeds (Krebs on Security, The Hacker News)
  - Other cybersecurity news APIs
- [ ] Choose a source and understand API limits

---

#### Task 5: Create data models for cybersecurity events
- [ ] Create `CyberSecurityEvent` class
- [ ] Add fields: title, description, url, publishedDate, summary
- [ ] Implement JSON serialization (`fromJson`, `toJson`)

**File location:** `lib/models/cyber_security_event.dart`

---

#### Task 6: Implement service to fetch cybersecurity news articles
- [ ] Create `NewsService` class
- [ ] Make HTTP GET requests
- [ ] Parse JSON responses
- [ ] Handle errors and exceptions

**File location:** `lib/services/news_service.dart`

---

#### Task 7: Create OpenAI service to summarize news articles
- [ ] Create `OpenAIService` class
- [ ] Send article text to OpenAI API
- [ ] Use GPT model for summarization
- [ ] Parse AI response

**File location:** `lib/services/openai_service.dart`

---

#### Task 8: Design UI for displaying summarized cybersecurity events
- [ ] Create home screen widget
- [ ] Use ListView.builder or Card widgets
- [ ] Display article title and AI summary
- [ ] Add loading indicators
- [ ] Apply styling

**File location:** `lib/screens/home_screen.dart`

---

#### Task 9: Implement tap-to-redirect functionality using url_launcher
- [ ] Wrap cards in GestureDetector or InkWell
- [ ] Use url_launcher to open URLs
- [ ] Test on device/emulator

---

#### Task 10: Set up Firebase Firestore to cache summaries
- [ ] Design Firestore collection structure
- [ ] Implement save summary to Firestore
- [ ] Implement fetch summary from Firestore
- [ ] Add logic to check cache before calling OpenAI

**Purpose:** Reduce API costs by avoiding re-summarization

---

#### Task 11: Add error handling and loading states
- [ ] Add try-catch blocks
- [ ] Display user-friendly error messages
- [ ] Handle network failures
- [ ] Add retry logic
- [ ] Create loading state UI

---

#### Task 12: Test the complete feature flow
- [ ] Manual testing
- [ ] Test without internet connection
- [ ] Test API failures
- [ ] Verify fetch → summarize → display → redirect flow

---

## Tech Stack

- **Framework:** Flutter
- **Backend:** Firebase (Firestore)
- **AI:** OpenAI API
- **State Management:** BLoC pattern
- **Package Name:** com.rutilo.cybersafetyapp
- **Key Packages:**
  - firebase_core: ^4.3.0
  - cloud_firestore: ^6.1.1
  - http: ^1.2.2
  - url_launcher: ^6.3.1
  - flutter_bloc: ^9.1.1
  - bloc: ^9.1.0

---

## Notes

- You chose **BLoC pattern** for state management (alternative: Provider, Riverpod)
- Remember to keep API keys secure and never commit them to version control
- Consider rate limits for both news API and OpenAI API

---

## Next Immediate Steps

1. Initialize Firebase in main.dart (final step of Task 2)
2. Get OpenAI API key (Task 3)
3. Choose a cybersecurity news source/API (Task 4)

---

**Last Updated:** 2025-12-23
