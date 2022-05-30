import 'package:flutter/material.dart';

import '../../../utils.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
    required this.answeredQues,
    required this.totalQues,
    required this.score,
  }) : super(key: key);

  final int answeredQues;
  final int totalQues;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60.0, bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 60.0,
        vertical: 10.0,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Question: ${answeredQues + 1}/$totalQues",
            style: textStyle.copyWith(color: primaryColor),
          ),
          Text(
            "Score: $score",
            style: textStyle.copyWith(color: primaryColor),
          ),
        ],
      ),
    );
  }
}
