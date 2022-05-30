import 'package:get/get.dart';
import 'package:ph_quiz/app/data/quiz_ques/quiz_ques.dart';

import '../../../data/quiz_ques/question.dart';
import '../repository/que_repo.dart';

class QAPageController extends GetxController {
  final QuizQuestionsRepository _repo = QuizQuestionsRepository();

  var status = "loading".obs; // loading, error, complete
  final quizQues = Rxn<List<Question>>();

  // quiz score
  late final int totalQues;
  var score = 0.obs;
  var answeredQues = 0.obs;
  

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

  void fetchQuizQuestions() async {
    status.value = "loading";
    print("fetch que");
    try {
      final response = await _repo.fetchQuizQuestions();
      quizQues.value = response.questions;
      totalQues = quizQues.value?.length ?? 0;
      print(quizQues.value?[2]);
      status.value = "complete";
    } catch (e) {
      status.value = "error";
      print("error : " + e.toString());
    }
  }

  void selectAns(String selectedOption) {
    print(selectedOption);
  }
}
