import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ph_quiz/app/modules/HomePage/controllers/homecontroller.dart';

import '../../routes/app_pages.dart';
import '../../utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Homecontroller _homeController = Get.put(
      Homecontroller(),
      tag: "home-controller",
    );
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20.0,
                ),
                child: Image.asset("assets/Logo.png")),
            Text(
              "Highscore",
              style: textStyle.copyWith(
                color: Colors.white,
              ),
            ),
            GetBuilder<Homecontroller>(
              id: "highscoreText",
              tag: "home-controller",
              builder: (_) {
                return Text(
                  "${_homeController.highScore.value}  Point",
                  style: textStyle.copyWith(
                    color: Colors.white,
                  ),
                );
              },
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
                      onPressed: () {
                        Get.toNamed(Routes.Q_A_PAGE);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: const Text(
                        "Start",
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
  }
}
