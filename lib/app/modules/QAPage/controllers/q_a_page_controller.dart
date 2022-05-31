import 'package:get/get.dart';

import '../../../data/quiz_ques/question.dart';
import '../../HomePage/controllers/homecontroller.dart';
import '../repository/que_repo.dart';

class QAPageController extends GetxController {
  final QuizQuestionsRepository _repo = QuizQuestionsRepository();

  var status = "loading".obs; // loading, error, complete
  final quizQues = Rxn<List<Question>>();

  // quiz score
  late final int totalQues;
  var totalScore = 0.obs;
  var answeredQues = 0.obs;
  var selectedAns = "".obs;
  var isCorrectAnsSelected = false.obs;
  var isAnsProcessing = false.obs;
  var gameOver = false.obs;

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
    try {
      final response = await _repo.fetchQuizQuestions();
      quizQues.value = response.questions;
      totalQues = quizQues.value?.length ?? 0;
      status.value = "complete";
    } catch (e) {
      status.value = "error";
      print("error : " + e.toString());
    }
  }

  void selectAns({
    required String selectedOption,
    required String correctAns,
    required int score,
  }) async {
    isAnsProcessing.value = true;
    selectedAns.value = selectedOption;
    isCorrectAnsSelected.value = correctAns == selectedOption;
    isCorrectAnsSelected.value ? {totalScore.value += score} : null;

    Future.delayed(const Duration(milliseconds: 2000), () {
      isAnsProcessing.value = false;
      selectedAns.value = "";
      isCorrectAnsSelected.value = false;
      answeredQues.value++;
      gameOver.value = answeredQues.value >= totalQues;
    });
  }
}
