import 'package:flutter/material.dart';

import '../../../data/quiz_ques/question.dart';
import '../../../utils.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    Key? key,
    required this.que,
  }) : super(key: key);

  final Question que;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text("${que.score} Points", style: textStyle),
          const SizedBox(height: 15.0),
          if (que.questionImageUrl != null)
            Image.network(
              que.questionImageUrl ?? "",
              width: 300.0,
              fit: BoxFit.contain,
              errorBuilder: (context, obj, _) {
                return const SizedBox.shrink();
              },
            ),
          const SizedBox(height: 15.0),
          Text(que.question ?? "",
              textAlign: TextAlign.center, style: textStyle),
        ],
      ),
    );
  }
}
