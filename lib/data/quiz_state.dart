class QuizStateController {
  static final QuizStateController _instance = QuizStateController._internal();
  factory QuizStateController() => _instance;
  QuizStateController._internal();

  int currentIndex = 0;
  final Map<int, int> selectedAnswers = {};
  final Set<int> doubtfulQuestions = {};
  int elapsedSeconds = 0;
  String currentUser = '';

  void reset() {
    currentIndex = 0;
    selectedAnswers.clear();
    doubtfulQuestions.clear();
    elapsedSeconds = 0;
  }
}
