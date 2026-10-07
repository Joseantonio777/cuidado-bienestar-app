import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/services/storage_service.dart';
import '../../../sos/widgets/sos_modal_sheet.dart';

class DesconexionPostTurnoScreen extends StatefulWidget {
  const DesconexionPostTurnoScreen({Key? key}) : super(key: key);

  @override
  State<DesconexionPostTurnoScreen> createState() => _DesconexionPostTurnoScreenState();
}

class _DesconexionPostTurnoScreenState extends State<DesconexionPostTurnoScreen> {
  Map<String, bool> _checklistState = {
    'step1': false,
    'step2': false,
    'step3': false,
  };
  bool _isLoading = true;

  final List<Map<String, dynamic>> _steps = [
    {
      'key': 'step1',
      'stepNum': 'Paso 1',
      'title': 'Cierre Visual y Formal de la Jornada',
      'icon': Icons.task_alt_rounded,
      'description':
          'Antes de salir del puesto o vehículo, revisa mentalmente que las tareas críticas quedaron registradas o entregadas a tu relevo. Declara conscientemente: "Mi turno ha terminado por hoy."',
    },
    {
      'key': 'step2',
      'stepNum': 'Paso 2',
      'title': 'Cambio de Vestimenta / Lavado de Manos Consciente',
      'icon': Icons.wash_rounded,
      'description':
          'Lávate la cara o las manos con agua fresca sintiendo la transición física. Quítate el uniforme o la vestimenta de servicio para simbolizar el desprendimiento de la carga operativa.',
    },
    {
      'key': 'step3',
      'stepNum': 'Paso 3',
      'title': 'Anclaje al Espacio Personal y Familiar',
      'icon': Icons.home_rounded,
      'description':
          'Al cruzar la puerta de tu hogar o iniciar tu trayecto de descanso, conecta con una actividad que te devuelva tu identidad personal (ej. escuchar música preferida, saludar con presencia a tus seres queridos).',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    final savedState = await StorageService.loadChecklistState();
    if (mounted) {
      setState(() {
        if (savedState.isNotEmpty) {
          _checklistState = savedState;
        }
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleStep(String key) async {
    setState(() {
      _checklistState[key] = !(_checklistState[key] ?? false);
    });
    await StorageService.saveChecklistState(_checklistState);
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _checklistState.values.where((val) => val).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutina de Desconexión Post-Turno'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.emeraldGreen.withOpacity(0.4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.do_not_disturb_on_outdoors_rounded,
                            color: AppColors.emeraldGreen, size: 30),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Límite Saludable Trabajo / Vida Personal',
                                style: TextStyle(
                                  color: AppColors.emeraldGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Checklist interactivo de 3 pasos para marcar la transición mental tras la jornada.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Contador de Pasos Completados
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progreso de Desconexión ($completedCount / 3)',
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (completedCount == 3)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.emeraldGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '¡Desconexión Completa!',
                            style: TextStyle(
                              color: AppColors.emeraldGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  ..._steps.map((step) {
                    final key = step['key'] as String;
                    final isChecked = _checklistState[key] ?? false;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      color: isChecked
                          ? AppColors.emeraldGreen.withOpacity(0.1)
                          : AppColors.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isChecked
                              ? AppColors.emeraldGreen
                              : AppColors.surfaceLight,
                          width: isChecked ? 2 : 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () => _toggleStep(key),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: AppColors.emeraldGreen,
                                onChanged: (_) => _toggleStep(key),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          step['icon'] as IconData,
                                          color: isChecked
                                              ? AppColors.emeraldGreen
                                              : AppColors.sereneBlue,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          step['stepNum'] as String,
                                          style: TextStyle(
                                            color: isChecked
                                                ? AppColors.emeraldGreen
                                                : AppColors.sereneBlue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      step['title'] as String,
                                      style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        decoration: isChecked
                                            ? TextDecoration.lineThrough
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      step['description'] as String,
                                      style: const TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 13,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),

                  Center(
                    child: TextButton.icon(
                      onPressed: () async {
                        setState(() {
                          _checklistState = {
                            'step1': false,
                            'step2': false,
                            'step3': false,
                          };
                        });
                        await StorageService.saveChecklistState(_checklistState);
                      },
                      icon: const Icon(Icons.refresh_rounded, color: AppColors.textMuted),
                      label: const Text(
                        'Reiniciar checklist para nuevo turno',
                        style: TextStyle(color: AppColors.textMuted),
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
