import 'package:flutter/material.dart';

class AppColors {
  // Paleta Principal (Slate & Dark Mode Salud Digital)
  static const Color background = Color(0F0F172A); // Slate 900
  static const Color surface = Color(0F1E293B);    // Slate 800
  static const Color surfaceLight = Color(0F334155); // Slate 700
  static const Color cardBorder = Color(0F475569);   // Slate 600

  // Acentuaciones
  static const Color sereneBlue = Color(0F38BDF8);  // Sky 400
  static const Color emeraldGreen = Color(0F10B981); // Emerald 500
  static const Color sosRed = Color(0FEF4444);       // Red 500
  static const Color sosRedDark = Color(0FB91C1C);   // Red 700

  // Texto
  static const Color textPrimary = Color(0FF8FAFC);  // Slate 50
  static const Color textSecondary = Color(0FF94A3B8); // Slate 400
  static const Color textMuted = Color(0FF64748B);     // Slate 500

  // Semáforo de Evaluación
  static const Color levelGreen = Color(0F10B981);  // 0 - 3 pts
  static const Color levelYellow = Color(0FF59E0B); // 4 - 7 pts
  static const Color levelOrange = Color(0FF97316); // 8 - 14 pts
  static const Color levelRed = Color(0FEF4444);    // 15+ pts

  // Sombras y Gradientes
  static const Gradient sosGradient = LinearGradient(
    colors: [Color(0FEF4444), Color(0FB91C1C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient sereneGradient = LinearGradient(
    colors: [Color(0F38BDF8), Color(0F0284C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
