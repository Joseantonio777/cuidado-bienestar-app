class AppStrings {
  // Configuración y Contacto Oficial de Emergencia / Orientación
  static const String appName = 'Cuidado & Bienestar';
  static const String appTagline = 'Apoyo Emocional, Autocuidado y Gestión del Estrés';
  static const String emergencyNumber = '941828634';
  static const String emergencyNumberDisplay = '9 4182 8634';

  // Exenciones Legales y Microcopy de Orientación
  static const String legalDisclaimer =
      'Esta aplicación entrega pautas de autocuidado, regulación emocional y detección temprana. '
      'NO constituye un diagnóstico clínico, psicoterapia ni reemplaza la atención médica profesional '
      'ni los protocolos institucionales de urgencia.';

  static const String privacyNotice =
      'Confidencialidad Total: No solicitamos tus nombres, RUT ni correos. '
      'Todos tus datos y registros se almacenan 100% de forma local y cifrada en tu dispositivo.';

  static const String destigmatizationMessage =
      'Pedir ayuda a tiempo no es una señal de debilidad. '
      'Es un acto de responsabilidad y valentía para cuidar tu salud y continuar cuidando a los demás.';

  // Módulo SOS 505
  static const String sosTitle = 'SOS 505 — Orientación Profesional Inmediata';
  static const String sosSubtitle = '¿Necesitas apoyo o conversar con alguien ahora?';
  static const String sosCallButton = 'Llamar a Orientación Profesional';
  static const String sosWhatsappButton = 'Contactar por WhatsApp';
  static const String sosProtocolMessage =
      'Si estás viviendo una situación de riesgo inminente o crisis extrema, '
      'activa los canales institucionales de emergencia o presiona los botones de contacto directo arriba.';

  // Módulo 1: Autoevaluación
  static const String evalTitle = '¿Cómo estoy hoy?';
  static const String evalSubtitle = 'Chequeo Rápido de Autocuidado (60 segundos)';
  static const String evalInstructions =
      'Selecciona con honestidad la frecuencia con la que has experimentado cada situación durante los últimos días.';

  // Respuestas Likert
  static const List<String> likertOptions = [
    '0: Nunca',
    '1: Algunos días',
    '2: Más de la mitad de los días',
    '3: Casi todos los días',
  ];

  // Diagnóstico Semáforo
  static const String levelGreenTitle = 'Nivel Verde — Sin señales importantes';
  static const String levelGreenDesc =
      'Te encuentras en un estado de equilibrio adecuado. Te sugerimos mantener tus hábitos de autocuidado, descanso y pausas recreativas.';

  static const String levelYellowTitle = 'Nivel Amarillo — Señales leves de cansancio';
  static const String levelYellowDesc =
      'Se observan algunos indicadores iniciales de tensión. Es un buen momento para incorporar los ejercicios de respiración y desconexión de la app.';

  static const String levelOrangeTitle = 'Nivel Naranja — Riesgo elevado / Alerta';
  static const String levelOrangeDesc =
      'Estás experimentando un nivel significativo de desgaste o sobrecarga mental. Te recomendamos hacer una pausa activa, priorizar tu descanso y conversar con un profesional o persona de confianza.';

  static const String levelRedTitle = 'Nivel Rojo — Sobre-exigencia crítica';
  static const String levelRedDesc =
      'Tus niveles de agotamiento o tensión están en un punto crítico. Es fundamental buscar orientación profesional sin demora. Recuerda que no estás solo/a.';
}
