# 🌿 Cuidado & Bienestar — Apoyo Emocional, Autocuidado y Gestión del Estrés Laboral/Personal

**Cuidado & Bienestar** es una aplicación móvil desarrollada en Flutter (Dart) diseñada desde los principios de **Diseño Ético e Integral (Human-First)**, **Salud Digital Preventiva** y **Psicología Organizacional**.

Número oficial de simulación de orientación profesional y emergencia: **`941828634`**.

---

## 🛡️ 1. Principios Éticohumanos y de Privacidad
1. **Confidencialidad Total (Privacidad por Diseño)**: No se solicitan nombres, RUT/DNI, correos ni datos personales de identificación. Toda la persistencia es 100% local en la memoria del dispositivo y protegida mediante obfusación cifrada.
2. **Orientación, NO Diagnóstico**: Todo el microcopy de la aplicación recuerda permanentemente que la herramienta entrega pautas de autocuidado, regulación y detección temprana, sin sustituir el diagnóstico o tratamiento médico/psicológico profesional.
3. **Desestigmatización ("Cultura del Cuidado")**: Promueve activamente la idea de que pedir ayuda a tiempo es una señal de responsabilidad y valentía profesional.
4. **Respuesta Rápida a Crisis**: Acceso de 1 solo toque a los canales de apoyo desde el botón omnipresente **SOS 505** en la barra de navegación y pantallas principales.

---

## 📱 2. Módulos y Funcionalidades Incluidas

### 🆘 Módulo Omnipresente: "SOS 505"
- Botón flotante destacado en la esquina inferior derecha y accesos directos en las barras superiores de la app.
- Despliega una hoja modal prioritaria con:
  - **Llamada telefónica directa** al `941828634`.
  - **Contacto directo por WhatsApp** al `941828634`.
  - Mensajes de protocolo legal y de orientación en situaciones de crisis inminente.

### 🔎 Módulo 1: "¿Cómo estoy?" (Autoevaluación de 60s)
- Cuestionario de 9 preguntas Likert (0: Nunca | 1: Algunos días | 2: Más de la mitad de los días | 3: Casi todos los días).
- **Algoritmo de Interrupción de Crisis**: Si el usuario marca puntuación > 0 en la **Pregunta 9** (*¿Pensamientos de que no vale la pena seguir o de hacerte daño?*), se suspende la evaluación y se abre inmediatamente el módulo SOS 505 en pantalla completa para orientarlo al `941828634`.
- **Semáforo de Resultados**:
  - 🟢 **0-3 pts (Verde)**: Estado óptimo / Mantener hábitos.
  - 🟡 **4-7 pts (Amarillo)**: Señales leves de cansancio.
  - 🟠 **8-14 pts (Naranja)**: Riesgo elevado / Se sugiere pausa activa y conversación.
  - 🔴 **15+ pts (Rojo)**: Sobre-exigencia crítica / Redirección a atención profesional.
- **Historial Local Privado**: Consulta tendencias de evaluaciones previas guardadas localmente.

### ⚠️ Módulo 2: "Reconoce las Señales" (Detección Temprana)
- Rejilla de 4 tarjetas interactivas clasificadas por dimensiones:
  - **Emocionales** (irritabilidad, frustración, sobrecarga).
  - **Físicas** (fatiga crónica, tensión muscular, trastornos de sueño).
  - **Cognitivas** (desatención, rumiación mental, indecisión).
  - **Conductuales** (aislamiento, cambios bruscos, consumo de sustancias).
- Banner central de desestigmatización.

### 🧘 Módulo 3: "Herramientas para sentirme mejor" (6 Módulos de Regulación)
1. **Respiración Guiada**: Visualizador circular animado con alternancia entre técnica 4-7-8 y respiración cuadrada 4x4.
2. **Pausa de Regulación (Grounding 5-4-3-2-1)**: Guía paso a paso para reconectar con los 5 sentidos.
3. **Relajación Muscular Progresiva**: Ejercicios de tensión y liberación por zonas corporales.
4. **Higiene del Sueño en Turnos**: Decálogo de pautas fisiológicas para personal de turnos nocturnos o rotativos.
5. **Rutina de Desconexión Post-Turno**: Checklist interactivo persistente de 3 pasos para cerrar la jornada mental.
6. **Red de Apoyo**: Guía con scripts y consejos para entablar conversaciones honestas con pares y familiares.

---

## 🎨 3. Especificación UI/UX (WCAG 2.1 AA)
- **Tema Visual**: Slate Dark Mode de Alta Legibilidad.
- **Fondo Principal**: Slate Oscuro `#0F172A`.
- **Superficies**: Azul Pizarra `#1E293B`.
- **Acentuaciones**: Serene Blue `#38BDF8` y Emerald Green `#10B981`.
- **Alertas / SOS**: Crimson Red `#EF4444`.
- **Accesibilidad**: Contraste > 4.5:1, zonas de toque >= 48x48dp.

---

## 🚀 4. Guía de Compilación en Android (APK)

### Requisitos Previos
- [Flutter SDK](https://flutter.dev) (versión 3.0.0 o superior)
- [Android SDK](https://developer.android.com/studio) instalado

### Pasos para compilar en APK:
```bash
# 1. Obtener dependencias
flutter pub get

# 2. Verificar análisis estático de código
flutter analyze

# 3. Compilar APK listo para instalación en Android
flutter build apk --release
```

El archivo APK generado se ubicará en:
`build/app/outputs/flutter-apk/app-release.apk`
