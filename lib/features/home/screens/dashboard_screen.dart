import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/storage_service.dart';
import '../../autoevaluacion/models/assessment_result.dart';
import '../../sos/widgets/sos_modal_sheet.dart';
import '../../senales/widgets/banner_frase.dart';

class DashboardScreen extends StatefulWidget {
  final Function(int) onNavigateToTab;

  const DashboardScreen({
    Key? key,
    required this.onNavigateToTab,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AssessmentResult? _lastResult;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLatestResult();
  }

  Future<void> _loadLatestResult() async {
    final history = await StorageService.getAssessmentHistory();
    if (mounted) {
      setState(() {
        if (history.isNotEmpty) {
          _lastResult = history.first;
        }
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.sereneBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_rounded, color: Colors.black, size: 20),
            ),
            const SizedBox(width: 10),
            const Text(
              AppStrings.appName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            tooltip: 'SOS 505',
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadLatestResult,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner de bienvenida confidencial
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0F1E293B), Color(0F334155)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.surfaceLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.emeraldGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.lock_outline_rounded,
                                  color: AppColors.emeraldGreen, size: 16),
                              SizedBox(width: 4),
                              Text(
                                'Espacio 100% Anónimo',
                                style: TextStyle(
                                  color: AppColors.emeraldGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tu bienestar emocional es una prioridad',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Monitorea tu nivel de cansancio laboral o personal y accede a ejercicios de autocuidado rápido.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Botón de Inicio Rápido a Chequeo 60s
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () => widget.onNavigateToTab(1), // Tab Autoevaluación
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sereneBlue,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                  ),
                  icon: const Icon(Icons.timer_outlined, size: 26),
                  label: const Text(
                    'Realizar Chequeo Rápido (60 Segundos)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tarjeta de Última Autoevaluación
              if (!_isLoading && _lastResult != null) ...[
                Card(
                  color: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: _lastResult!.color.withOpacity(0.5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: _lastResult!.color.withOpacity(0.2),
                          radius: 24,
                          child: Icon(Icons.analytics_rounded, color: _lastResult!.color),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Último Registro de Estado',
                                style: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _lastResult!.title,
                                style: TextStyle(
                                  color: _lastResult!.color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => widget.onNavigateToTab(1),
                          child: const Text('Reevaluar'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // REJILLA DE MÓDULOS PRINCIPALES
              Text(
                'Módulos de Apoyo',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Módulo 1: Autoevaluación
                  _buildModuleCard(
                    context,
                    title: '¿Cómo estoy?',
                    subtitle: 'Autoevaluación de 60s',
                    icon: Icons.assignment_turned_in_rounded,
                    color: AppColors.sereneBlue,
                    onTap: () => widget.onNavigateToTab(1),
                  ),

                  // Módulo 2: Reconoce las señales
                  _buildModuleCard(
                    context,
                    title: 'Señales',
                    subtitle: 'Detección temprana',
                    icon: Icons.find_in_page_rounded,
                    color: AppColors.emeraldGreen,
                    onTap: () => widget.onNavigateToTab(2),
                  ),

                  // Módulo 3: Herramientas
                  _buildModuleCard(
                    context,
                    title: 'Herramientas',
                    subtitle: '6 ejercicios prácticos',
                    icon: Icons.spa_rounded,
                    color: AppColors.levelYellow,
                    onTap: () => widget.onNavigateToTab(3),
                  ),

                  // Módulo SOS 505
                  _buildModuleCard(
                    context,
                    title: 'SOS 505',
                    subtitle: 'Orientación 941828634',
                    icon: Icons.phone_in_talk_rounded,
                    color: AppColors.sosRed,
                    onTap: () => SosModalSheet.show(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Banner de Desestigmatización
              const BannerFrase(),
              const SizedBox(height: 20),

              // Microcopy No Diagnóstico
              Text(
                AppStrings.legalDisclaimer,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: AppColors.surfaceLight),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
