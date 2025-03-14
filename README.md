# Biometric Authentication Flutter App

This Flutter project demonstrates how to implement **biometric authentication** using the `local_auth` package. The app verifies the user's identity via **fingerprint** or **face recognition** before allowing access to the main content.

## Installation
```bash
git clone <repo_link>
cd <repo_folder>
flutter pub get
```

## Android Configuration

**1. Update `MainActivity.kt`**
```kotlin
import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity : FlutterFragmentActivity() {
}
```

**2. Add Permissions in `AndroidManifest.xml`**
```xml
<uses-permission android:name="android.permission.USE_BIOMETRIC" />
<uses-permission android:name="android.permission.USE_FINGERPRINT" />
```

**3. Update `minSdkVersion` in `android/app/build.gradle`**
```gradle
defaultConfig {
    minSdkVersion 21
    targetSdkVersion 34
}
```

## iOS Configuration

**Add the following to your `ios/Runner/Info.plist`**
```xml
<key>NSFaceIDUsageDescription</key>
<string>We need to authenticate your identity using Face ID.</string>
```

## Usage

**Import `AuthUtils` in your widget:**
```dart
import 'utils/auth_utils.dart';

@override
void initState() {
  super.initState();
  AuthUtils.checkBiometrics();
}
```

**Authentication Implementation:**
```dart
onPressed: () async {
  await AuthUtils.checkBiometrics();
  final isAuthenticated = await AuthUtils.authenticate(context);

  if (isAuthenticated) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
  }
}
```

## Project Structure
```
lib/
 ┣ screens/
 ┃ ┣ auth_screen.dart
 ┃ ┗ home_screen.dart
 ┣ utils/
 ┃ ┗ auth_utils.dart
 ┣ main.dart
```

## Run the App
```bash
flutter clean
flutter pub get
flutter run
```

## Dependencies
- `local_auth`

## License
This project is licensed under the MIT License.

