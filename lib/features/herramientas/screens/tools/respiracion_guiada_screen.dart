import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../sos/widgets/sos_modal_sheet.dart';

class RespiracionGuiadaScreen extends StatefulWidget {
  const RespiracionGuiadaScreen({Key? key}) : super(key: key);

  @override
  State<RespiracionGuiadaScreen> createState() => _RespiracionGuiadaScreenState();
}

class _RespiracionGuiadaScreenState extends State<RespiracionGuiadaScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  bool _isRunning = false;
  bool _isBoxBreathing = false; // false = 4-7-8, true = 4x4 Cuadrada
  String _currentPhaseText = 'Presiona Iniciar para Comenzar';
  int _secondsRemainingInPhase = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _scaleAnimation = Tween<double>(begin: 0.65, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  void _startBreathingCycle() {
    setState(() {
      _isRunning = true;
    });
    _runNextPhase(0);
  }

  void _stopBreathingCycle() {
    _timer?.cancel();
    _animController.stop();
    _animController.reset();
    setState(() {
      _isRunning = false;
      _currentPhaseText = 'Sesión Finalizada. ¡Excelente trabajo!';
    });
  }

  void _runNextPhase(int phaseIndex) {
    if (!_isRunning) return;

    // 4-7-8: 0=Inhala(4s), 1=Mantén(7s), 2=Exhala(8s)
    // 4x4: 0=Inhala(4s), 1=Mantén(4s), 2=Exhala(4s), 3=Mantén sin aire(4s)
    final phases478 = [
      {'text': 'INHALA (4s)', 'duration': 4, 'action': 'expand'},
      {'text': 'MANTÉN EL AIRE (7s)', 'duration': 7, 'action': 'hold'},
      {'text': 'EXHALA SUAVEMENTE (8s)', 'duration': 8, 'action': 'contract'},
    ];

    final phasesBox = [
      {'text': 'INHALA (4s)', 'duration': 4, 'action': 'expand'},
      {'text': 'MANTÉN (4s)', 'duration': 4, 'action': 'hold'},
      {'text': 'EXHALA (4s)', 'duration': 4, 'action': 'contract'},
      {'text': 'PAUSA SIN AIRE (4s)', 'duration': 4, 'action': 'hold_empty'},
    ];

    final currentPhases = _isBoxBreathing ? phasesBox : phases478;
    final phase = currentPhases[phaseIndex % currentPhases.length];
    final duration = phase['duration'] as int;
    final action = phase['action'] as String;

    setState(() {
      _currentPhaseText = phase['text'] as String;
      _secondsRemainingInPhase = duration;
    });

    if (action == 'expand') {
      _animController.duration = Duration(seconds: duration);
      _animController.forward(from: 0.0);
    } else if (action == 'contract') {
      _animController.duration = Duration(seconds: duration);
      _animController.reverse(from: 1.0);
    } else {
      // hold or hold_empty
      _animController.stop();
    }

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted || !_isRunning) return;
      if (_secondsRemainingInPhase > 1) {
        setState(() {
          _secondsRemainingInPhase--;
        });
      } else {
        _timer?.cancel();
        _runNextPhase(phaseIndex + 1);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respiración Guiada'),
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
            // Selector de Técnica
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.surfaceLight),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: const Center(child: Text('Técnica 4-7-8 (Relajante)')),
                      selected: !_isBoxBreathing,
                      selectedColor: AppColors.sereneBlue,
                      backgroundColor: Colors.transparent,
                      labelStyle: TextStyle(
                        color: !_isBoxBreathing ? Colors.black : AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: _isRunning
                          ? null
                          : (val) {
                              setState(() {
                                _isBoxBreathing = false;
                              });
                            },
                    ),
                  ),
                  Expanded(
                    child: ChoiceChip(
                      label: const Center(child: Text('Cuadrada 4x4 (Enfoque)')),
                      selected: _isBoxBreathing,
                      selectedColor: AppColors.emeraldGreen,
                      backgroundColor: Colors.transparent,
                      labelStyle: TextStyle(
                        color: _isBoxBreathing ? Colors.black : AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: _isRunning
                          ? null
                          : (val) {
                              setState(() {
                                _isBoxBreathing = true;
                              });
                            },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),

            // ANIMACIÓN CIRCULAR EXPANSIVA
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 230,
                height: 230,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      _isBoxBreathing
                          ? AppColors.emeraldGreen.withOpacity(0.8)
                          : AppColors.sereneBlue.withOpacity(0.8),
                      _isBoxBreathing
                          ? AppColors.emeraldGreen.withOpacity(0.2)
                          : AppColors.sereneBlue.withOpacity(0.2),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (_isBoxBreathing
                              ? AppColors.emeraldGreen
                              : AppColors.sereneBlue)
                          .withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isRunning ? '$_secondsRemainingInPhase' : 'PAUSA',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Icon(
                        _isBoxBreathing ? Icons.square_outlined : Icons.air_rounded,
                        color: Colors.white70,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),

            // Texto de fase actual
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                _currentPhaseText,
                key: ValueKey(_currentPhaseText),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _isBoxBreathing ? AppColors.emeraldGreen : AppColors.sereneBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 30),

            // Botón de Inicio / Detener
            SizedBox(
              width: 220,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _isRunning ? _stopBreathingCycle : _startBreathingCycle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRunning ? AppColors.sosRed : AppColors.sereneBlue,
                  foregroundColor: _isRunning ? Colors.white : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: Icon(_isRunning ? Icons.stop_rounded : Icons.play_arrow_rounded),
                label: Text(
                  _isRunning ? 'Detener Sesión' : 'Iniciar Respiración',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Microcopy de orientación
            Text(
              AppStrings.legalDisclaimer,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
