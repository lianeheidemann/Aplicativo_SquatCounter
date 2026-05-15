import 'package:flutter/material.dart';

/// Centraliza o tema do aplicativo
class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),

      scaffoldBackgroundColor: Colors.grey.shade100,
    );
  }
}