# Migration Notes
Upgraded Flutter to the latest stable version (3.32.0) using FVM to ensure consistent version control across environments.

Executed fvm flutter pub get to resolve and fetch updated dependencies.

1. Flutter Codebase Migration

- Updated ThemeData usage by replacing deprecated bodyText1 and bodyText2 with bodyLarge and bodyMedium from the TextTheme.

### Native Android Configuration (Based on Flutter Migration Guide)
According to Flutter Migration Guide(https://tinyurl.com/5c9rsr79)

#### Reorganized Gradle configurations:

- Moved key configurations from android/build.gradle to android/settings.gradle as per new project structure guidelines.

####  Toolchain and compatibility updates:

- Upgraded Gradle distribution to 8.4 in gradle-wrapper.properties.

- Removed the deprecated buildscript block from android/build.gradle.

- Updated app/build.gradle:

- Set JavaVersion to 17.

- Configured kotlinOptions with jvmTarget = 17 for compatibility with the updated Android toolchain.


   