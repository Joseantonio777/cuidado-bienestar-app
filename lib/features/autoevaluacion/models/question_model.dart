class QuestionModel {
  final int id;
  final String text;
  final bool isCrisisQuestion;

  const QuestionModel({
    required this.id,
    required this.text,
    this.isCrisisQuestion = false,
  });

  static const List<QuestionModel> defaultQuestions = [
    QuestionModel(
      id: 1,
      text: '1. ¿Irritabilidad o menor paciencia de lo habitual?',
    ),
    QuestionModel(
      id: 2,
      text: '2. ¿Dificultad para conciliar o mantener el sueño?',
    ),
    QuestionModel(
      id: 3,
      text: '3. ¿Dificultad para desconectarte mentalmente de situaciones del trabajo o servicio?',
    ),
    QuestionModel(
      id: 4,
      text: '4. ¿Sensación de que las exigencias te están sobrepasando?',
    ),
    QuestionModel(
      id: 5,
      text: '5. ¿Pérdida de interés en actividades que normalmente disfrutas?',
    ),
    QuestionModel(
      id: 6,
      text: '6. ¿Dificultad para concentrarte o tomar decisiones?',
    ),
    QuestionModel(
      id: 7,
      text: '7. ¿Preferencia por aislarte de familiares, amigos o compañeros?',
    ),
    QuestionModel(
      id: 8,
      text: '8. ¿Necesidad de consumir alcohol o sustancias para relajarte o dormir?',
    ),
    QuestionModel(
      id: 9,
      text: '9. ¿Pensamientos de que no vale la pena seguir o de hacerte daño?',
      isCrisisQuestion: true,
    ),
  ];
}
