# Firebase Proguard Rules
-keep class com.google.firebase.** { *; }
-keep class com.firebase.** { *; }

# Google Play Services
-keep class com.google.android.gms.** { *; }

# Dart/Flutter specific
-keep class io.flutter.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Flutter plugin classes
-keep class * extends io.flutter.embedding.engine.FlutterPlugin { *; }
