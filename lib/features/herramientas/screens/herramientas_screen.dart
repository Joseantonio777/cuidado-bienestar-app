import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../sos/widgets/sos_modal_sheet.dart';

import 'tools/respiracion_guiada_screen.dart';
import 'tools/pausa_grounding_screen.dart';
import 'tools/relajacion_muscular_screen.dart';
import 'tools/higiene_sueno_screen.dart';
import 'tools/desconexion_post_turno_screen.dart';
import 'tools/red_apoyo_screen.dart';

class HerramientasScreen extends StatelessWidget {
  const HerramientasScreen({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> _toolsList = [
    {
      'title': '1. Respiración Guiada',
      'subtitle': 'Visualizador circular 4-7-8 y 4x4 Cuadrada',
      'icon': Icons.air_rounded,
      'color': AppColors.sereneBlue,
      'screen': RespiracionGuiadaScreen(),
    },
    {
      'title': '2. Pausa de Regulación',
      'subtitle': 'Ejercicio de Grounding 5-4-3-2-1',
      'icon': Icons.anchor_rounded,
      'color': AppColors.emeraldGreen,
      'screen': PausaGroundingScreen(),
    },
    {
      'title': '3. Relajación Muscular Progresiva',
      'subtitle': 'Liberación de tensión muscular por fases',
      'icon': Icons.fitness_center_rounded,
      'color': AppColors.levelYellow,
      'screen': RelajacionMuscularScreen(),
    },
    {
      'title': '4. Higiene del Sueño en Turnos',
      'subtitle': 'Decálogo para turnos nocturnos/rotativos',
      'icon': Icons.bedtime_rounded,
      'color': AppColors.levelOrange,
      'screen': HigieneSuenoScreen(),
    },
    {
      'title': '5. Rutina de Desconexión Post-Turno',
      'subtitle': 'Checklist de 3 pasos para desenganchar',
      'icon': Icons.door_back_door_rounded,
      'color': AppColors.emeraldGreen,
      'screen': DesconexionPostTurnoScreen(),
    },
    {
      'title': '6. Red de Apoyo',
      'subtitle': 'Guía y frases para conversar con pares',
      'icon': Icons.groups_rounded,
      'color': AppColors.sosRed,
      'screen': RedApoyoScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herramientas de Regulación'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            tooltip: 'SOS 505',
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '6 Módulos de Autocuidado Práctico',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Diseñados para aplicar antes, durante o al finalizar tu jornada de trabajo.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _toolsList.length,
              itemBuilder: (context, index) {
                final tool = _toolsList[index];
                final color = tool['color'] as Color;

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  color: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: AppColors.surfaceLight),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(tool['icon'] as IconData, color: color, size: 28),
                    ),
                    title: Text(
                      tool['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Text(
                      tool['subtitle'] as String,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.textMuted,
                      size: 18,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => tool['screen'] as Widget),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
