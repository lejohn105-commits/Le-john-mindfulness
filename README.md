# Le John Mindfulness App

A comprehensive Flutter wellness app built with Firebase for guided meditation, mood tracking, and progress analytics.

## Features

- 🧘 **Guided Meditation & Breathing Exercises** - Curated meditation sessions
- 😊 **Mood Tracking** - Daily emotion logging with notes
- 📊 **Progress Dashboard** - Track your wellness journey
- 🔔 **Daily Reminders** - Push notifications for consistency
- 👤 **User Profiles** - Personalized wellness tracking
- 💾 **Firebase Integration** - Secure cloud data storage

## Tech Stack

- **Framework**: Flutter
- **Backend**: Firebase (Auth, Realtime Database, Storage, Messaging)
- **Language**: Dart
- **Database**: Firebase Realtime Database

## Firebase Configuration

Your Firebase project is already configured:
- **Project ID**: le-john-mindfulness
- **Database**: Realtime Database
- **Storage**: Cloud Storage
- **Package Name**: com.lejohn.mindfulness

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Android SDK or iOS SDK
- Firebase CLI (optional)

### Installation

1. Clone the repository
```bash
git clone https://github.com/lejohn105-commits/le-john-mindfulness.git
cd le-john-mindfulness
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── screens/
│   ├── auth_screen.dart     # Authentication UI
│   ├── home_screen.dart     # Main navigation hub
├── services/
│   └── firebase_service.dart # Firebase operations
└── models/                   # Data models (to be added)
```

## Firebase Realtime Database Structure

```
users/
  ├── {userId}/
  │   ├── profile/
  │   │   ├── name
  │   │   ├── bio
  │   │   └── updatedAt
  │   ├── meditations/
  │   │   └── {sessionId}/
  │   │       ├── duration
  │   │       ├── date
  │   │       └── timestamp
  │   └── moods/
  │       └── {moodId}/
  │           ├── score (1-5)
  │           ├── notes
  │           ├── date
  │           └── timestamp
```

## Development Roadmap

- [ ] Complete meditation feature with timer
- [ ] Implement push notifications
- [ ] Add mood analytics & charts
- [ ] Create progress report generation
- [ ] Add offline support
- [ ] Implement social sharing
- [ ] Add voice guidance for meditations
- [ ] Create habit streaks & gamification

## Firebase Security Rules

Set up the following security rules in your Realtime Database:

```json
{
  "rules": {
    "users": {
      "$uid": {
        ".read": "$uid === auth.uid",
        ".write": "$uid === auth.uid"
      }
    }
  }
}
```

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or issues, please open an issue on the GitHub repository.
