# Google Play Store Deployment Guide

This guide explains how to set up automated deployment of your Flutter app to the Google Play Store using GitHub Actions.

## Prerequisites

1. **Google Play Console Account**
   - A Google Play Developer account ($25 one-time fee)
   - Your app already created in the Play Console
   - App signing enabled in Play Console

2. **Required Files**
   - Android Keystore file (`upload-keystore.jks`)
   - Key properties file (`key.properties`)
   - Google Play Service Account JSON

## Step 1: Prepare Your Keystore

1. If you haven't created a keystore:

   ```bash
   keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

2. Create `android/key.properties`:

   ```properties
   storePassword=<your-keystore-password>
   keyPassword=<your-key-password>
   keyAlias=upload
   storeFile=../upload-keystore.jks
   ```

## Step 2: Set Up Google Play Service Account

1. Go to Google Play Console
2. Navigate to Setup > API access
3. Click "Create new service account"
4. Follow the steps to create a service account
5. Download the JSON key file
6. Grant the service account access to your app in Play Console

## Step 3: Encode Required Files

1. Encode your keystore:

   ```bash
   base64 -i upload-keystore.jks -o keystoreBase64
   ```

2. Encode your key.properties:

   ```bash
   base64 -i android/key.properties -o keyPropertiesBase64
   ```

3. Encode your service account JSON:

   ```bash
   base64 -i service-account.json -o serviceAccountBase64
   ```

## Step 4: Add Secrets to GitHub

1. Go to your GitHub repository
2. Navigate to Settings > Secrets and variables > Actions
3. Add the following secrets:
   - `ANDROID_KEYSTORE`: Content of keystoreBase64 file
   - `ANDROID_KEY_PROPERTIES`: Content of keyPropertiesBase64 file
   - `PLAY_STORE_CREDENTIALS`: Content of serviceAccountBase64 file

## Step 5: Update Your App's Package Name

In the workflow file (`.github/workflows/playstore_deploy.yml`), replace:

```yaml
packageName: com.example.pretium_finance
```
with your actual package name from `android/app/build.gradle`

## Step 6: Configure Release Track

The workflow is set to deploy to the "internal" track. You can change this to:

- `internal`: For internal testing
- `alpha`: For alpha testing
- `beta`: For beta testing
- `production`: For production release

## How It Works

1. When you push to main, the workflow:
   - Sets up Java and Flutter
   - Decodes your keystore and credentials
   - Builds an Android App Bundle (AAB)
   - Uploads the AAB to Play Store

2. The app will be available in your chosen track after Google Play's processing

## Troubleshooting

### Build Fails

- Check if all secrets are properly encoded
- Verify package name matches Play Console
- Ensure service account has proper permissions

### Upload Fails

- Verify service account JSON is valid
- Check if app signing is properly configured
- Ensure version code is higher than previous release

### Play Store Rejects

- Check app compliance with Play Store policies
- Verify app signing configuration
- Ensure all required metadata is provided

## Security Notes

1. Never commit sensitive files to your repository
2. Regularly rotate your service account credentials
3. Use appropriate track for testing before production
4. Keep your keystore file secure and backed up

## Workflow File Structure

The workflow file (`.github/workflows/playstore_deploy.yml`) contains:

```yaml
name: Deploy to Play Store

on:
  push:
    branches:
      - main

jobs:
  deploy:
    name: Deploy to Play Store
    runs-on: ubuntu-latest
    permissions: write-all

    env:
      JAVA_VERSION: '11'
      FLUTTER_VERSION: '3.22.2'
      AAB_PATH: build/app/outputs/bundle/release/app-release.aab
      KEYSTORE_PATH: android/upload-keystore.jks
      KEY_PROPS_PATH: android/key.properties
      SERVICE_ACCOUNT_PATH: store_credentials.json

    steps:
      # ... (see the actual workflow file for complete steps)
```

## Common Issues and Solutions

1. **Version Code Conflicts**
   - Always increment version code in `pubspec.yaml`
   - Check current version in Play Console

2. **Signing Issues**
   - Verify keystore password is correct
   - Ensure key.properties paths are correct
   - Check if keystore is properly encoded

3. **Service Account Issues**
   - Verify JSON credentials are valid
   - Check service account permissions
   - Ensure proper API access is enabled

## Best Practices

1. **Version Management**
   - Use semantic versioning
   - Increment version code with each release
   - Keep changelog updated

2. **Testing**
   - Test in internal track first
   - Use alpha/beta for wider testing
   - Only use production for stable releases

3. **Security**
   - Rotate credentials periodically
   - Use different tracks for different purposes
   - Keep sensitive files secure

## Additional Resources

- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flutter Deployment Guide](https://flutter.dev/docs/deployment/android) 