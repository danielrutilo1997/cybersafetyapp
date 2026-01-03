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

#### Task 2: Configure Firebase project and connect to Flutter app
- [x] Created Firebase project in Firebase Console
- [x] Registered Flutter app (Android/iOS) with package name `com.rutilo.cybersafetyapp`
- [x] Downloaded `google-services.json` (Android)
- [x] Downloaded `GoogleService-Info.plist` (iOS)
- [x] Added Firebase config files to project
- [x] Updated `.gitignore` to exclude Firebase config files
- [x] Updated Android Gradle files with Google services plugin
- [x] Initialized Firebase in main.dart with `Firebase.initializeApp()`

**Resources:** [FlutterFire Documentation](https://firebase.flutter.dev/docs/overview)

#### Task 3: Set up OpenAI API configuration and API key management
- [x] Created OpenAI account and got API key
- [x] Set up secure API key storage in `keys.json`
- [x] Added `keys.json` to `.gitignore` for security
- [x] Used proper JSON format for key storage

**Resources:** [OpenAI Platform](https://platform.openai.com)

#### Task 4: Research and choose a cybersecurity news source/API
- [x] Explored options (NewsAPI.org, RSS feeds)
- [x] Chose BleepingComputer RSS feed
- [x] Identified feed URL: https://www.bleepingcomputer.com/feed/
- [x] Determined data format: RSS/XML (no API key required)

**Resources:** [BleepingComputer RSS Feed](https://www.bleepingcomputer.com/feed/)

#### Task 5: Create data models for cybersecurity events
- [x] Created `CyberSecurityEvent` class
- [x] Added fields: title, description, url, publishedDate, summary
- [x] Implemented JSON serialization (`fromJson`, `toJson`)

**File location:** `lib/models/cyber_security_event.dart`

#### Task 6: Implement service to fetch cybersecurity news articles
- [x] Created `NewsService` class structure
- [x] Added HTTP GET request logic
- [x] Added XML parsing logic for RSS feed
- [x] Fixed all syntax errors
- [x] Implemented error handling with try-catch
- [x] Added package dependency `xml: ^6.5.0`

**File location:** `lib/services/news_service.dart`

**Status:** NewsService implementation complete! Ready for testing or integration.

---

### 🔄 In Progress

#### Task 7: Create OpenAI service to summarize news articles
- [x] Created `openai_service.dart` file
- [ ] Create `OpenAIService` class structure - **WORKING ON**
- [ ] Implement HTTP POST request to OpenAI API
- [ ] Add proper headers (Authorization, Content-Type)
- [ ] Format request body with model and messages
- [ ] Parse JSON response to extract summary
- [ ] Add error handling

**File location:** `lib/services/openai_service.dart`

**Current Status:** Working on implementing the OpenAI service structure

**Key Info for Implementation:**
- API Endpoint: `https://api.openai.com/v1/chat/completions`
- Model: `gpt-3.5-turbo` or `gpt-4`
- Response format: Extract from `choices[0].message.content`

---

### 📋 Upcoming Tasks

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
- **News Source:** BleepingComputer RSS Feed
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

1. Create OpenAI service to summarize news articles (Task 7)
2. Design UI for displaying summarized cybersecurity events (Task 8)
3. Implement tap-to-redirect functionality (Task 9)

---

**Last Updated:** 2026-01-03
