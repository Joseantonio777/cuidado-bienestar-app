import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/services/emergency_service.dart';

class SosModalSheet extends StatelessWidget {
  final bool isCrisisTriggered;

  const SosModalSheet({
    Key? key,
    this.isCrisisTriggered = false,
  }) : super(key: key);

  static Future<void> show(BuildContext context, {bool isCrisisTriggered = false}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black87,
      builder: (context) => SosModalSheet(isCrisisTriggered: isCrisisTriggered),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        border: Border(
          top: BorderSide(color: AppColors.sosRed, width: 3),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Barra de arrastre superior
              Container(
                width: 48,
                height: 5,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppColors.textMuted,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // Encabezado de la Modal
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.sosRed.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.sos_rounded,
                      color: AppColors.sosRed,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isCrisisTriggered
                              ? '⚠️ RESPUESTA PRIORITARIA A CRISIS'
                              : 'SOS 505 — Orientación Inmediata',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: isCrisisTriggered
                                    ? AppColors.sosRed
                                    : AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Disponible 24/7 de forma confidencial',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Alerta especial si fue activado por pregunta de crisis
              if (isCrisisTriggered) ...[
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.sosRed.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.sosRed.withOpacity(0.4)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: AppColors.sosRed, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tu bienestar y tu vida son prioritarios. Has indicado una situación de alta vulnerabilidad; por favor, contáctate directamente ahora.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Mensaje de Protocolo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.surfaceLight),
                ),
                child: Text(
                  AppStrings.sosProtocolMessage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        height: 1.4,
                      ),
                ),
              ),
              const SizedBox(height: 24),

              // ACCIÓN PRINCIPAL: Botón Rojo de Llamada Telefónica (941828634)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final success = await EmergencyService.makeEmergencyCall();
                    if (!success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'No se pudo iniciar la llamada. Por favor marca directamente al 941828634',
                          ),
                          backgroundColor: AppColors.sosRed,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sosRed,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 4,
                  ),
                  icon: const Icon(Icons.phone_in_talk_rounded, size: 26),
                  label: const Text(
                    '📞 Llamar a Orientación Profesional (${AppStrings.emergencyNumberDisplay})',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // ACCIÓN SECUNDARIA: Botón Verde de WhatsApp (941828634)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final success = await EmergencyService.openEmergencyWhatsApp();
                    if (!success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'No se pudo abrir WhatsApp. Contacta al 941828634',
                          ),
                          backgroundColor: AppColors.emeraldGreen,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.emeraldGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 2,
                  ),
                  icon: const Icon(Icons.chat_bubble_rounded, size: 24),
                  label: const Text(
                    '💬 Contactar por WhatsApp',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Exención Legal (Microcopy éthique)
              Text(
                AppStrings.legalDisclaimer,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
              ),
              const SizedBox(height: 12),

              // Botón de cerrar
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Cerrar esta ventana',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
