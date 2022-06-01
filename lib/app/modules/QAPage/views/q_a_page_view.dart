import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/quiz_ques/question.dart';
import '../../..//utils.dart';

import '../controllers/q_a_page_controller.dart';
import 'answer_box.dart';
import 'score_board.dart';
import 'question_box.dart';

class QAPageView extends GetView<QAPageController> {
  const QAPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (controller.status.value == "loading") {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (controller.status.value == "complete") {
              final Question que = (controller.gameOver.value)
                  ? Question()
                  : controller.quizQues.value?[controller.answeredQues.value] ??
                      Question();
              return !(controller.gameOver.value)
                  ? Column(
                      children: [
                        ScoreBoard(
                          answeredQues: controller.answeredQues.value,
                          totalQues: controller.totalQues,
                          score: controller.totalScore.value,
                        ),
                        QuestionBox(que: que),
                        const SizedBox(height: 20.0),
                        AnswerBox(que: que, controller: controller),
                      ],
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Congratulations !!\nYou have completed the quiz!!",
                              textAlign: TextAlign.center,
                              style: textStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 60.0,
                                vertical: 20.0,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => Get.back(),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                      ),
                                      child: const Text(
                                        "Main Menu",
                                        style: textStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            } else if (controller.status.value == "error") {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ran into some problems \nPlease try again",
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () => controller.fetchQuizQuestions(),
                        icon: const Icon(
                          Icons.replay,
                          size: 26.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
