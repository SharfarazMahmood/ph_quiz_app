import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    return Scaffold(
      backgroundColor: const Color(0xFF050032),
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
            const Text(
              "Highscore",
              style: textStyle,
            ),
            Text(
              "5545" + "Point",
              style: textStyle,
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
                      child: Text(
                        "Start",
                        style:
                            textStyle.copyWith(color: const Color(0xFF050032)),
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