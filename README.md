# 🏋️ Squat Counter

Aplicativo mobile desenvolvido em Flutter

## 📌 Objetivo

O aplicativo **Squat Counter** utiliza sensores do smartphone (acelerômetro) para detectar movimentos de agachamento, contabilizando automaticamente:

- Repetições
- Séries
- Progresso do treino

O usuário define a quantidade de repetições por série e o número total de séries.

---

## ⚙️ Tecnologias utilizadas

- Flutter 3.41.4  
- Dart  
- sensors_plus (acelerômetro)  
- Android SDK 36.1.0  
- VS Code + Android Studio (emulação)

---

## 🧩 Estrutura do projeto

```
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

## 🏁 Fluxo do app

1. Usuário configura treino  
2. Inicia sensores  
3. App detecta movimento via acelerômetro  
4. Repetições são contabilizadas automaticamente  
5. Séries são controladas pelo sistema  
6. Treino finaliza ao atingir meta  

---

## 🎥 Demonstração

<img width="354" height="760" alt="1000313125" src="https://github.com/user-attachments/assets/0007261c-f7ac-48e4-80b8-3c0322c9f783" />








