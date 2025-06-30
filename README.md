# 🍓 Fruits App

A simple Flutter mobile application that displays a list of fruits with their details using a local JSON file.

## 📱 Features

- View a scrollable list of fruits.
- See details like:
  - Fruit name
  - Description
  - Image
- Data is loaded from a local JSON file for fast access and offline usage.

## 🛠️ Technologies Used

- [Flutter](https://flutter.dev/)
- Dart
- Local JSON parsing

## 📁 Project Structure

```bash
lib/
├── main.dart          # Entry point
├── models/
│   └── fruit_model.dart  # Data model for Fruit
├── pages/
│   └── home_page.dart    # UI for displaying fruit list
├── widgets/
│   └── fruit_card.dart   # Reusable widget to display each fruit
assets/
└── fruits.json        # Local JSON file with fruits data
