import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';

enum TrafficLightLevel { verde, amarillo, naranja, rojo, crisis }

class AssessmentResult {
  final DateTime date;
  final int totalScore;
  final TrafficLightLevel level;
  final bool isCrisisTriggered;

  AssessmentResult({
    required this.date,
    required this.totalScore,
    required this.level,
    this.isCrisisTriggered = false,
  });

  factory AssessmentResult.fromAnswers({
    required Map<int, int> answers,
  }) {
    final crisisScore = answers[9] ?? 0;
    if (crisisScore > 0) {
      return AssessmentResult(
        date: DateTime.now(),
        totalScore: answers.values.fold(0, (sum, val) => sum + val),
        level: TrafficLightLevel.crisis,
        isCrisisTriggered: true,
      );
    }

    final score = answers.values.fold(0, (sum, val) => sum + val);
    TrafficLightLevel level;

    if (score <= 3) {
      level = TrafficLightLevel.verde;
    } else if (score <= 7) {
      level = TrafficLightLevel.amarillo;
    } else if (score <= 14) {
      level = TrafficLightLevel.naranja;
    } else {
      level = TrafficLightLevel.rojo;
    }

    return AssessmentResult(
      date: DateTime.now(),
      totalScore: score,
      level: level,
      isCrisisTriggered: false,
    );
  }

  String get title {
    switch (level) {
      case TrafficLightLevel.verde:
        return AppStrings.levelGreenTitle;
      case TrafficLightLevel.amarillo:
        return AppStrings.levelYellowTitle;
      case TrafficLightLevel.naranja:
        return AppStrings.levelOrangeTitle;
      case TrafficLightLevel.rojo:
        return AppStrings.levelRedTitle;
      case TrafficLightLevel.crisis:
        return 'ALERTA DE CRISIS DETECTADA';
    }
  }

  String get description {
    switch (level) {
      case TrafficLightLevel.verde:
        return AppStrings.levelGreenDesc;
      case TrafficLightLevel.amarillo:
        return AppStrings.levelYellowDesc;
      case TrafficLightLevel.naranja:
        return AppStrings.levelOrangeDesc;
      case TrafficLightLevel.rojo:
        return AppStrings.levelRedDesc;
      case TrafficLightLevel.crisis:
        return 'Se ha identificado un nivel elevado de vulnerabilidad emocional. '
            'Por favor, activa de inmediato la orientación profesional del SOS 505.';
    }
  }

  Color get color {
    switch (level) {
      case TrafficLightLevel.verde:
        return AppColors.levelGreen;
      case TrafficLightLevel.amarillo:
        return AppColors.levelYellow;
      case TrafficLightLevel.naranja:
        return AppColors.levelOrange;
      case TrafficLightLevel.rojo:
      case TrafficLightLevel.crisis:
        return AppColors.levelRed;
    }
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'totalScore': totalScore,
        'level': level.index,
        'isCrisisTriggered': isCrisisTriggered,
      };

  factory AssessmentResult.fromJson(Map<String, dynamic> json) => AssessmentResult(
        date: DateTime.parse(json['date'] as String),
        totalScore: json['totalScore'] as int,
        level: TrafficLightLevel.values[json['level'] as int],
        isCrisisTriggered: json['isCrisisTriggered'] as bool? ?? false,
      );
}
