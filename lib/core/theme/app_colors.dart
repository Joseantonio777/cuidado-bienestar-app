import 'package:flutter/material.dart';

class AppColors {
  // Paleta Principal (Azul y Verde Suave - Bienestar y Calma)
  static const Color background = Color(0xFFF0F7FA);       // Azul hielo muy suave
  static const Color surface = Color(0xFFFFFFFF);          // Blanco puro limpio para tarjetas
  static const Color surfaceLight = Color(0xFFD6ECEB);     // Azul-verde pastel suave para bordes/fondos
  static const Color cardBorder = Color(0xFFC2E2E4);       // Borde celeste-menta suave
  static const Color softBlueBg = Color(0xFFE1F1FA);       // Fondo azul pastel suave
  static const Color softGreenBg = Color(0xFFE3F5EE);      // Fondo verde menta suave

  // Acentuaciones (Azul Sereno y Verde Suave)
  static const Color sereneBlue = Color(0xFF2B7BB9);       // Azul sereno armónico con logo 505
  static const Color emeraldGreen = Color(0xFF3DA58A);     // Verde salvia/menta suave
  static const Color sosRed = Color(0xFFE53935);           // Rojo emergencia (cruz del logo)
  static const Color sosRedDark = Color(0xFFB71C1C);       // Rojo emergencia profundo

  // Texto (Alto contraste legible sobre fondos claros)
  static const Color textPrimary = Color(0xFF16324A);      // Azul marino pizarra profundo
  static const Color textSecondary = Color(0xFF4A6572);    // Gris azulado medio
  static const Color textMuted = Color(0xFF6B8594);        // Gris azulado suave

  // Semáforo de Evaluación
  static const Color levelGreen = Color(0xFF2E9E7B);       // 0 - 3 pts
  static const Color levelYellow = Color(0xFFD98A00);      // 4 - 7 pts
  static const Color levelOrange = Color(0xFFE66A15);      // 8 - 14 pts
  static const Color levelRed = Color(0xFFE53935);         // 15+ pts

  // Sombras y Gradientes
  static const Gradient sosGradient = LinearGradient(
    colors: [Color(0xFFE53935), Color(0xFFB71C1C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient sereneGradient = LinearGradient(
    colors: [Color(0xFF3A8DC4), Color(0xFF4EB299)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient softBannerGradient = LinearGradient(
    colors: [Color(0xFFDDF0FA), Color(0xFFE0F5EC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
