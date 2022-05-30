import 'package:get/get.dart';
import 'package:ph_quiz/app/utils.dart';

class Homecontroller extends GetxController {
  var highScore = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getHighscore();
  }

  @override
  void onClose() {}

  getHighscore() async {
    int? score = await readHighscore();
    highScore.value = score.toString();
    update(["highscoreText"]);
  }
}
