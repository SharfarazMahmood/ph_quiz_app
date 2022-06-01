import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/quiz_ques/question.dart';
import '../../../utils.dart';
import '../../HomePage/controllers/homecontroller.dart';
import '../controllers/q_a_page_controller.dart';

class AnswerBox extends StatelessWidget {
  AnswerBox({
    Key? key,
    required this.que,
    required this.controller,
  }) : super(key: key);

  final Question que;
  final QAPageController controller;

  final Homecontroller _hc = Get.find<Homecontroller>(tag: "home-controller");

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> answers = que.answers?.toJson() ?? <String, dynamic>{};

    List<Widget> answersList = answers.entries
        .map(
          (e) => Obx(() {
            Color borderColor = Colors.white;

            if (controller.isAnsProcessing.value &&
                que.correctAnswer == e.key) {
              borderColor = Colors.greenAccent;
            } else if (!(que.correctAnswer == e.key) &&
                controller.selectedAns.value == e.key) {
              borderColor = Colors.redAccent;
            }

            return InkWell(
              onTap: !(controller.isAnsProcessing.value)
                  ? () {
                      controller.selectAns(
                        selectedOption: e.key,
                        correctAns: que.correctAnswer ?? "999",
                        score: que.score ?? 0,
                      );

                      if (_hc.highScore.value < controller.totalScore.value) {
                        _hc.saveHighscore(controller.totalScore.value);
                      }
                    }
                  : null,
              child: e.value != null
                  ? Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 60.0,
                        vertical: 6.0,
                      ),
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: borderColor,
                          width: 4.0,
                        ),
                      ),
                      child: Center(
                        child: Text(e.value ?? "", style: textStyle),
                      ),
                    )
                  : const SizedBox.shrink(),
            );
          }),
        )
        .toList();
    answersList.shuffle();
    return Column(
      children: answersList,
    );
  }
}
