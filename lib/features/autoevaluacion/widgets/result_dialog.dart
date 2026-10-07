import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../models/assessment_result.dart';
import '../../sos/widgets/sos_modal_sheet.dart';

class ResultDialog extends StatelessWidget {
  final AssessmentResult result;
  final VoidCallback onDismiss;

  const ResultDialog({
    Key? key,
    required this.result,
    required this.onDismiss,
  }) : super(key: key);

  static void show(BuildContext context, AssessmentResult result, VoidCallback onDismiss) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ResultDialog(result: result, onDismiss: onDismiss),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: result.color.withOpacity(0.6), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono Semáforo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: result.color.withOpacity(0.18),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForLevel(result.level),
                color: result.color,
                size: 44,
              ),
            ),
            const SizedBox(height: 16),

            // Puntaje
            Text(
              'Puntaje Total: ${result.totalScore} / 27 pts',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),

            // Título de Nivel
            Text(
              result.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: result.color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),

            // Descripción Semáforo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.surfaceLight),
              ),
              child: Text(
                result.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5,
                      color: AppColors.textPrimary,
                    ),
              ),
            ),
            const SizedBox(height: 20),

            // Recordatorio Microcopy de Orientación (No Diagnóstico)
            Text(
              AppStrings.legalDisclaimer,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textMuted,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            // Botones de Acción
            Column(
              children: [
                if (result.level == TrafficLightLevel.naranja ||
                    result.level == TrafficLightLevel.rojo) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                        SosModalSheet.show(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.sosRed,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.phone_in_talk_rounded),
                      label: const Text('Contactar Orientación SOS (941828634)'),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onDismiss();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.sereneBlue,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Aceptar y Finalizar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForLevel(TrafficLightLevel level) {
    switch (level) {
      case TrafficLightLevel.verde:
        return Icons.sentiment_satisfied_alt_rounded;
      case TrafficLightLevel.amarillo:
        return Icons.sentiment_neutral_rounded;
      case TrafficLightLevel.naranja:
        return Icons.sentiment_dissatisfied_rounded;
      case TrafficLightLevel.rojo:
      case TrafficLightLevel.crisis:
        return Icons.warning_amber_rounded;
    }
  }
}
