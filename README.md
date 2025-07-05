# 📱 Flutter App

A Flutter application built using **FVM-managed Flutter version 3.32.0**, following  **clean folder architecture** for scalability and maintainability.

---

## 🚀 How to Run the Project

### 🔧 Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install) (Managed via FVM)
- [FVM (Flutter Version Manager)](https://fvm.app/docs/getting_started/installation/)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code (with Flutter and Dart plugins)
- Xcode (for iOS development, macOS only)

---

### Install FVM

```bash
brew tap leoafarias/fvm
brew install fvm
```

### ▶️ Run with FVM

1. **Install dependencies**:
```bash
fvm install
fvm flutter pub get
```

### ▶️ ***Run for model generations***
```bash
make runner-build
```

### Project Architecture
Used Clean Architecture in this project where each feature seperated and layered from api call to user render.
 
- Data Layer: contains api call data sources, models and repository implementation
- Domain Layer: contains abstract repository and entity class that will contain data to show in UI and also use case which is responsible for application logic
- Presentation Layer: this layer contains cubit state management and root pages and it's seperated widgets

### State management (BLoC/Cubit):
 Used BLoC/Cubit as a state management. Cubit is a lightweight version of BLoC (Business Logic Component) from the flutter_bloc package. It's part of the same library but offers a simpler way to manage state.

 - Managing and emitting UI states (e.g., loading, success, error)

 - Handling business logic like API calls or local DB operations

 - Updating the UI reactively via state changes


## Migration Approach
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


   