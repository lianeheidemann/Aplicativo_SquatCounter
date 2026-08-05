# Squat Counter App

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

## Flutter Mobile Application

**Squat Counter** uses the smartphone accelerometer to detect squat movements and automatically track:

- Repetitions
- Sets
- Workout progress

Users configure the number of repetitions per set and the total number of sets.

---

## Technologies

- Flutter 3.41.4
- Dart
- sensors_plus (accelerometer)
- Android SDK 36.1.0
- VS Code and Android Studio for emulation

---

## Project Structure

```text
lib/
 ├── core/
 │   ├── services/sensor_service.dart
 │   └── theme/app_theme.dart
 │
 ├── features/workout/
 │   ├── controllers/workout_controller.dart
 │   ├── models/workout_config.dart
 │   ├── screens/
 │   │   ├── workout_setup_screen.dart
 │   │   └── workout_session_screen.dart
 │   └── widgets/
 │       ├── number_selector.dart
 │       └── progress_card.dart
 │
 └── main.dart
```

---

## Application Flow

1. The user configures the workout.
2. The application starts the sensors.
3. Movement is detected through the accelerometer.
4. Repetitions are counted automatically.
5. Sets are tracked by the system.
6. The workout ends when the goal is reached.

---

## Demonstration

<img width="35%" src="https://github.com/user-attachments/assets/0007261c-f7ac-48e4-80b8-3c0322c9f783" alt="Squat Counter App demonstration" />
