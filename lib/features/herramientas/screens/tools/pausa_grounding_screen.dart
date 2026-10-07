import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../sos/widgets/sos_modal_sheet.dart';

class PausaGroundingScreen extends StatefulWidget {
  const PausaGroundingScreen({Key? key}) : super(key: key);

  @override
  State<PausaGroundingScreen> createState() => _PausaGroundingScreenState();
}

class _PausaGroundingScreenState extends State<PausaGroundingScreen> {
  int _currentStep = 0;

  final List<Map<String, dynamic>> _steps = [
    {
      'number': '5',
      'title': 'Cosas que puedes VER',
      'icon': Icons.remove_red_eye_rounded,
      'color': AppColors.sereneBlue,
      'description':
          'Mira a tu alrededor en el espacio físico actual. Identifica 5 objetos específicos (ej. un bolígrafo, una ventana, la textura de la mesa, un reloj).',
      'example': '1. Ventana | 2. Cuaderno | 3. Reloj | 4. Lámpara | 5. Silla',
    },
    {
      'number': '4',
      'title': 'Cosas que puedes TOCAR',
      'icon': Icons.back_hand_rounded,
      'color': AppColors.emeraldGreen,
      'description':
          'Presta atención a las sensaciones táctiles directas. Siente 4 texturas o contactos físicos (ej. el apoyo de tus pies en el piso, la tela de tu ropa, la temperatura de tus manos).',
      'example': '1. Pies en el suelo | 2. Presión de la ropa | 3. Mesa fría | 4. Postura',
    },
    {
      'number': '3',
      'title': 'Sonidos que puedes ESCUCHAR',
      'icon': Icons.hearing_rounded,
      'color': AppColors.levelYellow,
      'description':
          'Cierra los ojos un segundo si te resulta cómodo. Escucha 3 sonidos de tu entorno (ej. el aire acondicionado, pasos a lo lejos, tu propia respiración).',
      'example': '1. Zumbido de fondo | 2. Pasos distantes | 3. Tu respiración',
    },
    {
      'number': '2',
      'title': 'Olores que puedes PERCIBIR',
      'icon': Icons.air_rounded,
      'color': AppColors.levelOrange,
      'description':
          'Nota 2 aromas o sensaciones olfativas presentes (ej. café recien preparado, alcohol en gel, aire fresco, la tela de tu prendas).',
      'example': '1. Alcohol/Desinfectante | 2. Café o té',
    },
    {
      'number': '1',
      'title': 'Sabor que puedes RECONOCER',
      'icon': Icons.restaurant_rounded,
      'color': AppColors.sosRed,
      'description':
          'Concéntrate en 1 sabor en tu boca (ej. el resabio de agua, menta, café o simplemente la humedad natural de tu boca).',
      'example': '1. Sabor a menta o sorbo de agua fresca',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final stepData = _steps[_currentStep];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pausa Grounding 5-4-3-2-1'),
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
          children: [
            // Banner explicativo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.surfaceLight),
              ),
              child: Row(
                children: [
                  const Icon(Icons.anchor_rounded, color: AppColors.sereneBlue, size: 28),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Técnica de Anclaje al Presente: Reduce la sobreactivación del sistema nervioso reconectando con tus 5 sentidos.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tarjeta Pasos 5-4-3-2-1
            Card(
              color: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: (stepData['color'] as Color).withOpacity(0.6),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: (stepData['color'] as Color).withOpacity(0.2),
                      child: Text(
                        stepData['number'] as String,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: stepData['color'] as Color,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Icon(
                      stepData['icon'] as IconData,
                      color: stepData['color'] as Color,
                      size: 32,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      stepData['title'] as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      stepData['description'] as String,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.5,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lightbulb_rounded,
                              color: AppColors.sereneBlue, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Ejemplos: ${stepData['example']}',
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Controles de Navegación del Paso
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: _currentStep > 0
                      ? () {
                          setState(() {
                            _currentStep--;
                          });
                        }
                      : null,
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Anterior'),
                ),
                Text(
                  'Paso ${_currentStep + 1} de ${_steps.length}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_currentStep < _steps.length - 1) {
                      setState(() {
                        _currentStep++;
                      });
                    } else {
                      // Finalizado
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            '¡Excelente! Has completado la Pausa de Anclaje.',
                          ),
                          backgroundColor: AppColors.emeraldGreen,
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: stepData['color'] as Color,
                    foregroundColor: Colors.white,
                  ),
                  icon: Icon(_currentStep < _steps.length - 1
                      ? Icons.arrow_forward_rounded
                      : Icons.check_circle_rounded),
                  label: Text(_currentStep < _steps.length - 1 ? 'Siguiente' : 'Completar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
