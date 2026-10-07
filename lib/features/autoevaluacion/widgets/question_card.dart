import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../models/question_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionModel question;
  final int? selectedScore;
  final ValueChanged<int> onSelectScore;

  const QuestionCard({
    Key? key,
    required this.question,
    required this.selectedScore,
    required this.onSelectScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: question.isCrisisQuestion
          ? AppColors.sosRed.withOpacity(0.08)
          : AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: question.isCrisisQuestion
              ? AppColors.sosRed.withOpacity(0.4)
              : AppColors.cardBorder.withOpacity(0.5),
          width: question.isCrisisQuestion ? 1.5 : 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Etiqueta especial si es la pregunta de crisis #9
            if (question.isCrisisQuestion) ...[
              Row(
                children: [
                  const Icon(Icons.shield_outlined, color: AppColors.sosRed, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Pregunta de Seguridad y Bienestar',
                    style: TextStyle(
                      color: AppColors.sosRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],

            // Texto de la Pregunta
            Text(
              question.text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    height: 1.4,
                    color: question.isCrisisQuestion
                        ? AppColors.textPrimary
                        : AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: 16),

            // Opciones Likert (0 a 3)
            Column(
              children: List.generate(4, (index) {
                final isSelected = selectedScore == index;
                final optionText = AppStrings.likertOptions[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: double.infinity,
                  child: InkWell(
                    onTap: () => onSelectScore(index),
                    borderRadius: BorderRadius.circular(12),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (question.isCrisisQuestion && index > 0
                                ? AppColors.sosRed.withOpacity(0.2)
                                : AppColors.sereneBlue.withOpacity(0.18))
                            : AppColors.background.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? (question.isCrisisQuestion && index > 0
                                  ? AppColors.sosRed
                                  : AppColors.sereneBlue)
                              : AppColors.surfaceLight,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked_rounded
                                : Icons.radio_button_off_rounded,
                            color: isSelected
                                ? (question.isCrisisQuestion && index > 0
                                    ? AppColors.sosRed
                                    : AppColors.sereneBlue)
                                : AppColors.textMuted,
                            size: 22,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              optionText,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.textPrimary
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
