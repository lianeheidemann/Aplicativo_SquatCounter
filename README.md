# 🏋️ Squat Counter

Aplicativo mobile desenvolvido em Flutter para a disciplina de **Laboratório de Programação Mobile (Ciência da Computação)**.

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

## 📱 Funcionalidades

### ✔ Configuração do treino
- Definição de repetições por série
- Definição de número de séries

### ✔ Detecção por sensores
- Uso do acelerômetro via `sensors_plus`
- Detecção de movimento com base em variação nos eixos X, Y e Z

### ✔ Contador automático
- Incremento de repetições com base no movimento
- Controle automático de séries
- Finalização do treino ao atingir a meta

### ✔ Progresso em tempo real
- Série atual
- Repetições atuais
- Status do treino

### ✔ Finalização do treino
- Exibe mensagem de conclusão
- Opção de reiniciar treino

---

## 🧠 Lógica dos sensores

O app detecta movimento quando há variação significativa nos eixos:

```dart
final movementDetected =
    x.abs() > 12 ||
    y.abs() > 12 ||
    z.abs() > 12;
```

Um cooldown de 1.5s evita múltiplas contagens para o mesmo movimento.

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

## 📌 Observações técnicas

- Uso de `StreamSubscription` para leitura dos sensores  
- Controle de estado manual (sem Provider)  
- Arquitetura modular simples por features  
- Detecção aproximada de movimento físico  
- Interface responsiva com Material 3  

---

## 🎥 Demonstração

Adicione aqui seu GIF ou vídeo:

<img width="354" height="760" alt="1000313125" src="https://github.com/user-attachments/assets/0007261c-f7ac-48e4-80b8-3c0322c9f783" />

---

## 👨‍💻 Autor

Projeto desenvolvido para a disciplina de  
**Laboratório de Programação Mobile**  
Curso: Ciência da Computação



