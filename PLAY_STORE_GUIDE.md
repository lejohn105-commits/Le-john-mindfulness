# Google Play Store Deployment Guide

This guide will help you submit "Le John Mindfulness" to the Google Play Store.

## Prerequisites

- Google Play Developer account ($25 one-time fee)
- Android device or emulator for testing
- Flutter SDK installed
- Java Development Kit (JDK) 11+

## Step 1: Create a Signing Key

### 1a. Generate a keystore file

Run this command in your project root:

```bash
keytool -genkey -v -keystore ~/mindfulness-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10950 \
  -alias mindfulness-key
```

You'll be prompted to:
- Enter keystore password
- Enter key password
- Fill in certificate details (name, organization, city, etc.)

**Save these passwords securely!**

### 1b. Create key.properties file

Create `android/key.properties` file with your key details:

```properties
storePassword=your_keystore_password
keyPassword=your_key_password
keyAlias=mindfulness-key
storeFile=/path/to/mindfulness-release-key.jks
```

**⚠️ IMPORTANT:** Add this file to `.gitignore` (already done)

## Step 2: Build Release APK/AAB

### Build App Bundle (Recommended for Play Store)

```bash
flutter build appbundle --release
```

The build output will be at: `build/app/outputs/bundle/release/app-release.aab`

### Or Build APK (for testing)

```bash
flutter build apk --release
```

The build output will be at: `build/app/outputs/apk/release/app-release.apk`

## Step 3: Prepare Play Store Assets

### Create these files/assets:

1. **App Icon** (512x512 PNG)
   - Place in `assets/icon.png`

2. **Screenshots** (for each screen size)
   - Phone: 1080x1920 px (at least 2, max 8)
   - Tablet: 1440x2560 px (optional)
   - Create sample images showing:
     - Welcome/Auth screen
     - Meditation features
     - Mood tracking
     - Progress dashboard

3. **Feature Graphic** (1024x500 PNG)
   - Banner for store listing

4. **Description & Copy**
   - Short description (80 characters max)
   - Full description (4000 characters max)
   - Video URL (optional)

## Step 4: Set Up on Google Play Console

1. Go to [Google Play Console](https://play.google.com/console)
2. Click "Create app"
3. Fill in app details:
   - **App name**: Le John Mindfulness
   - **Default language**: English
   - **App category**: Health & Fitness
   - **Type**: App

## Step 5: Fill in App Details

### App Information
- **App name**: Le John Mindfulness
- **App description**:
  ```
  Discover inner peace with Le John Mindfulness - your personal wellness companion.
  
  Features:
  - Guided meditation sessions for all levels
  - Daily mood tracking with emotional insights
  - Track your meditation progress and streaks
  - Personalized wellness reminders
  - Secure cloud synchronization with Firebase
  
  Start your mindfulness journey today!
  ```

- **Category**: Health & Fitness / Medical
- **Content rating**: Select appropriate rating

### Target Audience
- Age rating: 3+ (or adjust based on content)
- Privacy policy URL: (required)
- Data safety: Complete the questionnaire

## Step 6: Upload Assets

1. **App icon**: 512x512 PNG
2. **Screenshots**: Minimum 2, recommended 4-6
3. **Feature graphic**: 1024x500 PNG
4. **App description**: As shown above

## Step 7: Content Rating

Complete the content rating questionnaire:
- Violence: None
- Sexual content: None
- Profanity: None
- Alcohol/Tobacco: None
- Other: N/A

## Step 8: Pricing & Distribution

1. **Pricing**: Free or Paid (select "Free")
2. **Countries**: Select target countries
3. **Consent**: Accept developer agreement

## Step 9: Upload App Bundle

1. Go to **Release** > **Production**
2. Click "Create new release"
3. Upload your `app-release.aab`
4. Add release notes:
   ```
   Version 1.0.0 - Initial Release
   
   - Guided meditation sessions
   - Mood tracking
   - Progress dashboard
   - Firebase cloud sync
   ```

## Step 10: Review & Submit

1. Review all information
2. Check **Pre-launch report** (automated testing)
3. Fix any issues if needed
4. Click "Submit for review"

**Review time**: Usually 24-48 hours

## Post-Launch

### Monitor Performance
- Check crash reports
- Monitor user ratings
- Review user feedback

### Update Process
1. Increment version code in `pubspec.yaml`
2. Rebuild app bundle: `flutter build appbundle --release`
3. Upload to Play Console
4. Submit for review

## Troubleshooting

### Build fails with signing error
- Check `key.properties` path is correct
- Verify passwords are correct
- Ensure `.jks` file exists

### App rejected in review
- Check content policy compliance
- Ensure privacy policy is valid
- Verify all assets are appropriate

### Low ratings
- Monitor crash reports
- Fix Firebase connection issues
- Improve UI/UX based on feedback

## Important Security Notes

⚠️ **Keep your signing key safe!**
- Back up `mindfulness-release-key.jks` securely
- Never commit `key.properties` to Git
- Use same key for all updates

## Resources

- [Flutter Publishing Guide](https://flutter.dev/docs/deployment/android)
- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [Android App Signing](https://developer.android.com/studio/publish/app-signing)
- [Play Store Policies](https://play.google.com/about/developer-content-policy/)
