# OZ.LA — Android-only build using an Android phone

This package includes the Flutter source and a GitHub Actions workflow that builds the Android APK in the cloud. You do not need a computer or Android Studio.

## Build from an Android phone

1. Download and extract `OZLA_Flutter_Source_v1.zip` on your Android phone.
2. In your mobile browser, sign in to GitHub or create an account at https://github.com.
3. Create a new repository named `ozla-mobile`. Choose **Private** if you want to keep the source private.
4. In the repository, use **Add file → Upload files** and upload the extracted project contents. Make sure the `.github/workflows/build-android.yml` file is included. If your mobile browser hides dot-folders, enable “Show hidden files” in your file manager or use GitHub's web editor to create the workflow file at that exact path.
5. Commit the files to the `main` branch.
6. Open the repository's **Actions** tab. Select **Build OZ.LA Android APK** and tap **Run workflow** if it has not started automatically.
7. Wait for the workflow to finish with a green check mark. Open the successful run, scroll to **Artifacts**, and download `ozla-android-apk`.
8. Extract the downloaded artifact ZIP. Inside is `app-release.apk`.
9. Tap `app-release.apk` to install. If Android asks, allow your browser or file manager to **Install unknown apps** for this installation, then retry.

## Important
- The cloud workflow generates the Android platform folder and builds the release APK.
- The APK is not signed with a personal Play Store upload key. It is suitable for direct testing/installation; use a managed signing key for future Play Store publication and upgrade continuity.
- Google Sites remain hosted by Google. Some Google sign-in flows or embedded Google services may require opening in an external browser.
- Check that all six Google Sites are published and accessible to the intended audience.
- The workflow requires a GitHub account and internet access. GitHub Actions usage limits may apply.
