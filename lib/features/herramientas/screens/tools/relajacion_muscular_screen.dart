import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../sos/widgets/sos_modal_sheet.dart';

class RelajacionMuscularScreen extends StatefulWidget {
  const RelajacionMuscularScreen({Key? key}) : super(key: key);

  @override
  State<RelajacionMuscularScreen> createState() => _RelajacionMuscularScreenState();
}

class _RelajacionMuscularScreenState extends State<RelajacionMuscularScreen> {
  int _currentZone = 0;

  final List<Map<String, String>> _zones = [
    {
      'zone': '1. Cuello y Hombros',
      'instructionTense': 'Eleva los hombros hacia tus orejas y aprieta levemente el cuello durante 5 segundos.',
      'instructionRelease': 'Suelta de golpe y deja caer los hombros sintiendo la liberación de la tensión acumulada.',
      'tip': 'Ideal para quienes sostienen tensión postural o carga pesada durante el turno.',
    },
    {
      'zone': '2. Brazos y Manos',
      'instructionTense': 'Cierra ambos puños con firmeza y tensa tus antebrazos por 5 segundos.',
      'instructionRelease': 'Abre las manos completamente, estira los dedos y siente la calidez del flujo sanguíneo.',
      'tip': 'Relaja el estrés motor y la rigidez de manipulación fina.',
    },
    {
      'zone': '3. Abdomen y Torax',
      'instructionTense': 'Inhala profundo y aprieta el abdomen como si fueras a recibir un impacto leve durante 5 segundos.',
      'instructionRelease': 'Exhala despacio y afloja toda la pared abdominal liberando el aire por la boca.',
      'tip': 'Ayuda a regular la respiración diafragmática y la ansiedad visceral.',
    },
    {
      'zone': '4. Piernas y Pies',
      'instructionTense': 'Estira las piernas y flexiona los pies hacia arriba sintiendo la tensión en pantorrillas y muslos.',
      'instructionRelease': 'Suelta y apoya suavemente los pies en el piso sintiendo pesadez placentera.',
      'tip': 'Esencial para recuperar la agilidad tras largas horas de pie o caminando.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final zoneData = _zones[_currentZone];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relajación Muscular Progresiva'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tensión y Liberación Consciente',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Alterna entre tensionar 5s y soltar para resetear la memoria de estrés físico.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Tarjeta de la zona muscular actual
            Card(
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: AppColors.sereneBlue, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.fitness_center_rounded, color: AppColors.sereneBlue, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          zoneData['zone']!,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.sereneBlue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const Divider(color: AppColors.surfaceLight, height: 28),

                    // FASE 1: Tensión
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.sosRed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.sosRed.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.bolt_rounded, color: AppColors.sosRed, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'FASE 1: TENSIÓN (5 Segundos)',
                                style: TextStyle(
                                  color: AppColors.sosRed,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            zoneData['instructionTense']!,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // FASE 2: Liberación
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.emeraldGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.emeraldGreen.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.spa_rounded, color: AppColors.emeraldGreen, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'FASE 2: LIBERACIÓN (10 Segundos)',
                                style: TextStyle(
                                  color: AppColors.emeraldGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            zoneData['instructionRelease']!,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        const Icon(Icons.info_outline_rounded, color: AppColors.textMuted, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            zoneData['tip']!,
                            style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Navegación entre zonas musculares
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: _currentZone > 0
                      ? () {
                          setState(() {
                            _currentZone--;
                          });
                        }
                      : null,
                  child: const Text('Zona Anterior'),
                ),
                Text(
                  'Grupo ${_currentZone + 1} de ${_zones.length}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentZone < _zones.length - 1) {
                      setState(() {
                        _currentZone++;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Excelente! Completaste el circuito de Relajación Muscular.'),
                          backgroundColor: AppColors.emeraldGreen,
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sereneBlue,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(_currentZone < _zones.length - 1 ? 'Siguiente Zona' : 'Finalizar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
