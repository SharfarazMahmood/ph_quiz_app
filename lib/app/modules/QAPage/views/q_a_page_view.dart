import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/quiz_ques/question.dart';
import '../../..//utils.dart';

import '../controllers/q_a_page_controller.dart';
import 'score_board.dart';
import 'question_box.dart';

class QAPageView extends GetView<QAPageController> {
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
              final Question que =
                  controller.quizQues.value?[controller.answeredQues.value] ??
                      Question();
              return Column(
                children: [
                  ScoreBoard(
                    answeredQues: controller.answeredQues.value,
                    totalQues: controller.totalQues,
                    score: controller.score.value,
                  ),
                  QuestionBox(que: que),
                  const SizedBox(height: 20.0),
                  AnswerBox(que: que, controller: controller),
                ],
              );
            } else {
              return Column(
                children: [
                  const Text("Ran into some problems \nPlease try again"),
                  IconButton(
                    onPressed: () {
                      controller.fetchQuizQuestions();
                    },
                    icon: const Icon(Icons.replay),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    Key? key,
    required this.que,
    required this.controller,
  }) : super(key: key);

  final Question que;
  final QAPageController controller;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> answers = que.answers?.toJson() ?? <String, dynamic>{};
    return Column(
      children: answers.entries
          .map(
            (e) => InkWell(
              onTap: () {
                controller.selectAns(e.key);
              },
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
                          color:  Colors.cyan,
                          width: 4.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          e.value ?? "",
                          style: textStyle,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          )
          .toList(),
    );
  }
}
