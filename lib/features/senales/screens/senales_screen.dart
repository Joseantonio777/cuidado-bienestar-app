import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/banner_frase.dart';
import '../widgets/senales_category_card.dart';
import '../../sos/widgets/sos_modal_sheet.dart';

class SenalesScreen extends StatelessWidget {
  const SenalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reconoce las Señales'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            tooltip: 'SOS 505',
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner central destacado
            const BannerFrase(),
            const SizedBox(height: 24),

            Text(
              'Dimensiones de Detección Temprana',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Haz clic en cada tarjeta para explorar los indicadores y sugerencias asociadas.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),

            // 1. Emocionales
            const SenalesCategoryCard(
              title: 'Señales Emocionales',
              subtitle: 'Irritabilidad, frustración, sobrecarga',
              icon: Icons.sentiment_dissatisfied_rounded,
              accentColor: AppColors.sereneBlue,
              signals: [
                'Irritabilidad o menor tolerancia a imprevistos habituales.',
                'Sensación de frustración persistente o impotencia.',
                'Tristeza profunda o abatimiento tras la jornada.',
                'Sobrecarga emocional o desapego afectivo defensivo.',
              ],
              recommendation:
                  'Pausa breve: Reconoce lo que sientes sin juzgarte. Hablarlo con un par reduce la carga mental.',
            ),

            // 2. Físicas
            const SenalesCategoryCard(
              title: 'Señales Físicas',
              subtitle: 'Fatiga crónica, tensión muscular, sueño',
              icon: Icons.accessibility_new_rounded,
              accentColor: AppColors.emeraldGreen,
              signals: [
                'Fatiga o cansancio persistente que no cede con el descanso habitual.',
                'Tensión constante en cuello, hombros o zona lumbar.',
                'Dolores de cabeza frecuentes o pesadez ocular.',
                'Alteraciones significativas del apetito o del patrón de sueño.',
              ],
              recommendation:
                  'Acción física: Aplica el módulo de Relajación Muscular y estiramientos post-turno.',
            ),

            // 3. Cognitivas
            const SenalesCategoryCard(
              title: 'Señales Cognitivas',
              subtitle: 'Desatención, rumiación mental, indecisión',
              icon: Icons.psychology_rounded,
              accentColor: AppColors.levelOrange,
              signals: [
                'Desatención o lapsos de memoria en tareas rutinarias.',
                'Rumiación mental reiterada sobre procedimientos o eventos pasados.',
                'Dificultad o lentitud para tomar decisiones cotidianas.',
                'Sensación de niebla mental o saturación de información.',
              ],
              recommendation:
                  'Pausa cognitiva: Realiza el ejercicio Grounding 5-4-3-2-1 para reenfocar el presente.',
            ),

            // 4. Conductuales
            const SenalesCategoryCard(
              title: 'Señales Conductuales',
              subtitle: 'Aislamiento, cambios de hábito, consumo',
              icon: Icons.group_off_rounded,
              accentColor: AppColors.sosRed,
              signals: [
                'Tendencia al aislamiento de familiares, amigos o compañeros.',
                'Cambios bruscos de humor o reactividad en interacciones.',
                'Postergación recurrente de momentos de descanso o alimentación.',
                'Aumento del consumo de alcohol, cafeína o sustancias para relajar.',
              ],
              recommendation:
                  'Atención directa: Activa tu red de apoyo o presiona SOS 505 para conversar con un profesional.',
            ),

            const SizedBox(height: 24),
            // Tarjeta de apoyo SOS
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.sosRed.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.sosRed.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.phone_in_talk_rounded, color: AppColors.sosRed, size: 30),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '¿Identificas varias de estas señales?',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Accede a la orientación profesional anónima del 941828634.',
                          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => SosModalSheet.show(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.sosRed,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    ),
                    child: const Text('SOS'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
