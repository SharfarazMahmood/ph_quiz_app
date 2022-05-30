import 'package:get/get.dart';
import 'package:ph_quiz/app/data/quiz_ques/quiz_ques.dart';

import '../repository/que_repo.dart';

class QAPageController extends GetxController {
  final QuizQuestionsRepository _repo = QuizQuestionsRepository();
  final count = 0.obs;

  var status = "loading".obs; // loading, error, complete
  final quizQues = Rxn<QuizQues>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchQuizQuestions();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void fetchQuizQuestions() async {
    status.value = "loading";
    print("fetch que");
    try {
      final response = await _repo.fetchQuizQuestions();
      print(response.toString());
      status.value = "complete";
    } catch (e) {
      status.value = "error";
      print("error : "+e.toString());
    }
  }
}
