import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../sos/widgets/sos_modal_sheet.dart';

class HigieneSuenoScreen extends StatelessWidget {
  const HigieneSuenoScreen({Key? key}) : super(key: key);

  static const List<Map<String, String>> _decalogo = [
    {
      'num': '01',
      'title': 'Bloqueo de Luz al Regresar',
      'desc': 'Utiliza lentes de sol oscuros al salir del turno nocturno camino a casa para evitar que la luz solar suprima la melatonina.',
    },
    {
      'num': '02',
      'title': 'Oscuridad Total en Dormitorio',
      'desc': 'Usa cortinas blackout o antifaz para dormir. La oscuridad estimula el sueño profundo incluso de día.',
    },
    {
      'num': '03',
      'title': 'Corte Estratégico de Cafeína',
      'desc': 'Evita consumir café, energizantes o mate durante las últimas 5 horas del turno.',
    },
    {
      'num': '04',
      'title': 'Insonorización Ambiental',
      'desc': 'Usa tapones de oído o generadores de ruido blanco (ventilador) para aislarnos del ruido diurno externo.',
    },
    {
      'num': '05',
      'title': 'Alimentación Liviana Pre-Sueño',
      'desc': 'Come una colación liviana antes de acostarte. Evita comidas pesadas o ricas en grasas que alteren la digestión.',
    },
    {
      'num': '06',
      'title': 'Temperatura Confortable',
      'desc': 'Mantén la habitación fresca (alrededor de 18-20°C). El cuerpo necesita bajar su temperatura central para conciliar el sueño.',
    },
    {
      'num': '07',
      'title': 'Desconexión de Pantallas',
      'desc': 'Evita mirar el teléfono o noticias al acostarte. La luz azul activa el estado de alerta cerebral.',
    },
    {
      'num': '08',
      'title': 'Acuerdos Familiares y de Hogar',
      'desc': 'Comunica a tu entorno tus horarios de descanso para evitar interrupciones o ruidos durante tu ventana de sueño.',
    },
    {
      'num': '09',
      'title': 'Siesta Estratégica Pre-Turno',
      'desc': 'Una siesta corta de 20 a 30 minutos antes de entrar al turno de noche mejora el rendimiento sin dejar inercia de sueño.',
    },
    {
      'num': '10',
      'title': 'No Forzar el Sueño en la Cama',
      'desc': 'Si llevas 20 minutos sin poder dormir, sal de la cama, realiza una actividad tranquila a luz tenue y regresa al sentir somnolencia.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Higiene del Sueño en Turnos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sos_rounded, color: AppColors.sosRed),
            onPressed: () => SosModalSheet.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.sereneBlue.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.bedtime_rounded, color: AppColors.sereneBlue, size: 32),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Decálogo de Sueño para Turnos Nocturnos / Rotativos',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColors.sereneBlue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Pautas de autocuidado fisiológico para proteger tu recuperación metabólica y mental.',
                          style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ..._decalogo.map((item) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: AppColors.surfaceLight),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.sereneBlue.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            item['num']!,
                            style: const TextStyle(
                              color: AppColors.sereneBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['desc']!,
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
                )),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
