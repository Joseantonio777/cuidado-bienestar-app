import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/autoevaluacion/models/assessment_result.dart';

class StorageService {
  static const String _keyHistory = 'cuidado_eval_history_enc';
  static const String _keyLastScore = 'cuidado_last_score';
  static const String _keyChecklistState = 'cuidado_checklist_post_shift';

  /// Guarda de forma anónima el resultado de una autoevaluación
  static Future<void> saveAssessmentResult(AssessmentResult result) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final history = await getAssessmentHistory();
      history.insert(0, result); // Más reciente primero

      // Limitar a los últimos 30 registros por optimización local
      if (history.length > 30) {
        history.removeRange(30, history.length);
      }

      final jsonList = history.map((e) => e.toJson()).toList();
      final rawString = jsonEncode(jsonList);
      final obfuscated = _obfuscate(rawString);

      await prefs.setString(_keyHistory, obfuscated);
      await prefs.setInt(_keyLastScore, result.totalScore);
    } catch (e) {
      debugPrint('Error guardando evaluación local: $e');
    }
  }

  /// Obtiene el historial de autoevaluaciones del usuario
  static Future<List<AssessmentResult>> getAssessmentHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final obfuscated = prefs.getString(_keyHistory);
      if (obfuscated == null || obfuscated.isEmpty) return [];

      final rawString = _deobfuscate(obfuscated);
      final List<dynamic> decoded = jsonDecode(rawString);
      return decoded.map((e) => AssessmentResult.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      debugPrint('Error leyendo historial local: $e');
      return [];
    }
  }

  /// Guarda el estado de tareas de la rutina post-turno
  static Future<void> saveChecklistState(Map<String, bool> state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyChecklistState, jsonEncode(state));
  }

  /// Carga el estado de la rutina post-turno
  static Future<Map<String, bool>> loadChecklistState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final str = prefs.getString(_keyChecklistState);
      if (str == null) return {};
      final Map<String, dynamic> decoded = jsonDecode(str);
      return decoded.map((key, value) => MapEntry(key, value as bool));
    } catch (e) {
      return {};
    }
  }

  /// Obfuscación ligera local para privacidad por diseño (Base64 + XOR)
  static String _obfuscate(String input) {
    final bytes = utf8.encode(input);
    final key = 0x5A;
    final obfuscated = bytes.map((b) => b ^ key).toList();
    return base64Encode(obfuscated);
  }

  static String _deobfuscate(String input) {
    final bytes = base64Decode(input);
    final key = 0x5A;
    final original = bytes.map((b) => b ^ key).toList();
    return utf8.decode(original);
  }
}
