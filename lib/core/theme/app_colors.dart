import 'package:flutter/material.dart';

class AppColors {
  // Paleta Principal (Slate & Dark Mode Salud Digital)
  static const Color background = Color(0xFF0F172A); // Slate 900
  static const Color surface = Color(0xFF1E293B);    // Slate 800
  static const Color surfaceLight = Color(0xFF334155); // Slate 700
  static const Color cardBorder = Color(0xFF475569);   // Slate 600

  // Acentuaciones
  static const Color sereneBlue = Color(0xFF38BDF8);  // Sky 400
  static const Color emeraldGreen = Color(0xFF10B981); // Emerald 500
  static const Color sosRed = Color(0xFFEF4444);       // Red 500
  static const Color sosRedDark = Color(0xFFB91C1C);   // Red 700

  // Texto
  static const Color textPrimary = Color(0xFFF8FAFC);  // Slate 50
  static const Color textSecondary = Color(0xFF94A3B8); // Slate 400
  static const Color textMuted = Color(0xFF64748B);     // Slate 500

  // Semáforo de Evaluación
  static const Color levelGreen = Color(0xFF10B981);  // 0 - 3 pts
  static const Color levelYellow = Color(0xFFF59E0B); // 4 - 7 pts
  static const Color levelOrange = Color(0xFFF97316); // 8 - 14 pts
  static const Color levelRed = Color(0xFFEF4444);    // 15+ pts

  // Sombras y Gradientes
  static const Gradient sosGradient = LinearGradient(
    colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient sereneGradient = LinearGradient(
    colors: [Color(0xFF38BDF8), Color(0xFF0284C7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
