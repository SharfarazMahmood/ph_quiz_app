import 'package:ph_quiz/app/data/quiz_ques/quiz_ques.dart';

import '../../../network_client.dart';

class QuizQuestionsRepository {
  final NetworkClient _client = NetworkClient();

  Future<QuizQues> fetchQuizQuestions() async {
    final response = await _client.get("quiz.json");
    return QuizQues.fromJson(response);
  }
}
