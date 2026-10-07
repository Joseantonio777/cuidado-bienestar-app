import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_strings.dart';

class EmergencyService {
  /// Realiza la llamada directa al número oficial de orientación profesional 941828634
  static Future<bool> makeEmergencyCall() async {
    final Uri callUri = Uri(
      scheme: 'tel',
      path: AppStrings.emergencyNumber,
    );

    try {
      if (await canLaunchUrl(callUri)) {
        return await launchUrl(callUri);
      } else {
        // Fallback for launchUrl directly
        return await launchUrl(callUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error al intentar realizar llamada: $e');
      return false;
    }
  }

  /// Inicia un chat en WhatsApp con el número oficial 941828634
  static Future<bool> openEmergencyWhatsApp() async {
    const String message = 'Hola, necesito orientación profesional y apoyo emocional.';
    final String encodedMsg = Uri.encodeComponent(message);
    
    // Probar con código de país de Chile (+56) si aplica o número directo
    final Uri waUri = Uri.parse('https://wa.me/56${AppStrings.emergencyNumber}?text=$encodedMsg');
    final Uri waFallback = Uri.parse('https://wa.me/${AppStrings.emergencyNumber}?text=$encodedMsg');

    try {
      if (await canLaunchUrl(waUri)) {
        return await launchUrl(waUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(waFallback)) {
        return await launchUrl(waFallback, mode: LaunchMode.externalApplication);
      } else {
        return await launchUrl(waUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error al intentar abrir WhatsApp: $e');
      return false;
    }
  }
}
