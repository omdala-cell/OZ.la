# OZ.LA Flutter Mobile Application

A Flutter starter application for Android and iOS that brings six OZ.LA Google Sites into one mobile app.

## Included
- OZ.LA home dashboard
- Six knowledge category cards and directory
- Google Sites displayed inside the app using WebView
- Loading indicator, refresh, in-app back navigation
- Open current site in external browser
- Home / Knowledge / About navigation

## Google Sites configured
1. https://sites.google.com/view/ozpay-la/home
2. https://sites.google.com/view/ozbank/home
3. https://sites.google.com/view/ozdx-la/home
4. https://sites.google.com/view/ozreg-la/home
5. https://sites.google.com/view/ozcib-la/home
6. https://sites.google.com/view/ozdi-la/home

## Requirements
- Flutter SDK (stable channel)
- Android Studio and/or Xcode (Xcode is required to build iOS)
- Android SDK for Android builds

## Run
```bash
flutter pub get
flutter run
```

## Build Android
```bash
flutter build apk --release
```
APK output: `build/app/outputs/flutter-apk/app-release.apk`

For Play Store:
```bash
flutter build appbundle --release
```

## Build iOS
On macOS with Xcode:
```bash
flutter build ios --release
```
Then configure signing and distribution in Xcode. An iOS build cannot be produced on Windows or Linux.

## Notes before publishing
- Confirm that all six Google Sites are published for the intended audience and that their sharing settings allow access.
- Test Google sign-in and any restricted pages on physical Android and iOS devices. Google authentication may open in an external browser or require additional OAuth configuration; this starter app does not implement Google account sign-in.
- Google Sites content remains hosted and maintained by Google Sites; this app is a mobile access shell, not a content migration.
- Add privacy policy, support contact, app icon, screenshots, store listing, and appropriate data-safety disclosures before public release.
- Verify external links and any downloads/forms on each site in WebView. Some Google services may intentionally open in a browser.
- Update Android package identifier and iOS bundle identifier to the final registered identifiers before store submission.
