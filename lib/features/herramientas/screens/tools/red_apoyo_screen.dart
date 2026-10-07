import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../sos/widgets/sos_modal_sheet.dart';

class RedApoyoScreen extends StatelessWidget {
  const RedApoyoScreen({Key? key}) : super(key: key);

  static const List<Map<String, String>> _guia = [
    {
      'target': 'Con un Compañero de Confianza (Par)',
      'context': 'Cuando sientas que la exigencia del servicio te sobrepasa o necesitase desahogarte.',
      'script': '"Hola, ¿tienes unos minutos en la pausa? He estado sintiendo bastante tensión estos días y me ayudaría mucho comentártelo brevemente en confianza."',
      'tip': 'Hablar entre pares reduce la sensación de soledad y normaliza la cultura del cuidado.',
    },
    {
      'target': 'Con tu Familia o Pareja',
      'context': 'Al llegar a casa sobrecargado/a y querer evitar reaccionar con menor paciencia.',
      'script': '"Hoy fue una jornada muy exigente emocionalmente. Necesito 20 minutos de tranquilidad para ducharme y bajar revoluciones antes de conversar."',
      'tip': 'Establece expectativas claras con empatía para proteger el clima familiar.',
    },
    {
      'target': 'Con Orientación Profesional (941828634)',
      'context': 'Cuando notes que tus propios recursos o pausas ya no son suficientes.',
      'script': '"Hola, llamo a la línea de orientación. Quisiera apoyo para procesar una situación de desgaste profesional/personal que estoy viviendo."',
      'tip': 'Llamar al 941828634 es 100% confidencial, gratuito y accesible 24/7.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Red de Apoyo y Conversación'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.sereneBlue.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.groups_rounded, color: AppColors.sereneBlue, size: 30),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Guía de Comunicación Honesta',
                          style: TextStyle(
                            color: AppColors.sereneBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Pedir ayuda es un acto de valentía profesional. Utiliza estas frases modelo para iniciar conversaciones sin estigma.',
                          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ..._guia.map((item) => Card(
                  margin: const EdgeInsets.only(bottom: 18),
                  color: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: AppColors.surfaceLight),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['target']!,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cuándo usar: ${item['context']}',
                          style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                        ),
                        const Divider(color: AppColors.surfaceLight, height: 20),

                        // Frase sugerida
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.sereneBlue.withOpacity(0.2)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '💬 Frase sugerida:',
                                style: TextStyle(
                                  color: AppColors.sereneBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item['script']!,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            const Icon(Icons.stars_rounded, color: AppColors.emeraldGreen, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item['tip']!,
                                style: const TextStyle(
                                  color: AppColors.emeraldGreen,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 12),

            // Botón de llamado directo
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () => SosModalSheet.show(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.sosRed,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.phone_in_talk_rounded),
                label: const Text(
                  'Hablar con Orientación Profesional (${AppStrings.emergencyNumberDisplay})',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
