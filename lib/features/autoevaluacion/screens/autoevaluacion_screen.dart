import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/storage_service.dart';
import '../models/question_model.dart';
import '../models/assessment_result.dart';
import '../widgets/question_card.dart';
import '../widgets/result_dialog.dart';
import '../widgets/history_bottom_sheet.dart';
import '../../sos/widgets/sos_modal_sheet.dart';

class AutoevaluacionScreen extends StatefulWidget {
  const AutoevaluacionScreen({Key? key}) : super(key: key);

  @override
  State<AutoevaluacionScreen> createState() => _AutoevaluacionScreenState();
}

class _AutoevaluacionScreenState extends State<AutoevaluacionScreen> {
  final Map<int, int> _answers = {};
  final List<QuestionModel> _questions = QuestionModel.defaultQuestions;
  final ScrollController _scrollController = ScrollController();

  void _onAnswerQuestion(int questionId, int score) {
    setState(() {
      _answers[questionId] = score;
    });

    // ALGORITMO CRÍTICO DE INTERRUPCIÓN DE CRISIS (PREGUNTA #9)
    if (questionId == 9 && score > 0) {
      _triggerCrisisInterruption();
    }
  }

  void _triggerCrisisInterruption() {
    // Abrir inmediatamente la respuesta prioritaria SOS 505 en pantalla completa/modal
    SosModalSheet.show(context, isCrisisTriggered: true);
  }

  bool get _allAnswered => _answers.length == _questions.length;

  void _calculateAndShowResult() async {
    if (!_allAnswered) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor responde las 9 preguntas para completar tu chequeo.'),
          backgroundColor: AppColors.levelOrange,
        ),
      );
      return;
    }

    final result = AssessmentResult.fromAnswers(answers: _answers);

    if (result.isCrisisTriggered) {
      _triggerCrisisInterruption();
      return;
    }

    // Guardar en almacenamiento cifrado local
    await StorageService.saveAssessmentResult(result);

    if (mounted) {
      ResultDialog.show(context, result, () {
        setState(() {
          _answers.clear();
        });
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final answeredCount = _answers.length;
    final progress = answeredCount / _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Cómo estoy hoy?'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: AppColors.sereneBlue),
            tooltip: 'Historial Local',
            onPressed: () => HistoryBottomSheet.show(context),
          ),
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            tooltip: 'SOS 505',
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner de privacidad y aclaración no diagnóstica
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.sereneBlue.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.security, color: AppColors.emeraldGreen, size: 22),
                      const SizedBox(width: 8),
                      Text(
                        '100% Anónimo y Confidencial',
                        style: TextStyle(
                          color: AppColors.emeraldGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppStrings.evalSubtitle,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.sereneBlue,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.legalDisclaimer,
                    style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Barra de progreso de preguntas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progreso: $answeredCount de ${_questions.length} completadas',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    color: AppColors.sereneBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.surfaceLight,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.sereneBlue),
              ),
            ),
            const SizedBox(height: 24),

            // Lista de Preguntas
            ..._questions.map((q) => QuestionCard(
                  question: q,
                  selectedScore: _answers[q.id],
                  onSelectScore: (score) => _onAnswerQuestion(q.id, score),
                )),

            const SizedBox(height: 12),

            // Botón de Finalizar y Ver Diagnóstico
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _calculateAndShowResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.emeraldGreen,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 4,
                ),
                icon: const Icon(Icons.analytics_outlined, size: 24),
                label: const Text(
                  'Obtener Orientación de Autocuidado',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
