import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/q_a_page_controller.dart';

class QAPageView extends GetView<QAPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050032),
      body: Obx(
        () {
          if (controller.status.value == "loading") {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (controller.status.value == "complete") {
            return const Center(
              child: Text(
                'QAPageView is working',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
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
    );
  }
}
