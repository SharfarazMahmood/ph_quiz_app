import 'package:get/get.dart';
import 'package:ph_quiz/app/utils.dart';

class Homecontroller extends GetxController {
  var highScore = 0.obs;

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
    highScore.value = score ?? 0;
    update(["highscoreText"]);
  }

  saveHighscore(int score) async {
    await setHighscore(score);
    await getHighscore();
  }
}
