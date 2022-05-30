import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const primaryColor = Color(0xFF050032);
const textStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const String key_ph_quiz_highscore = "ph_quiz_highscore";

saveHighscore(int score) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key_ph_quiz_highscore, score);
  } catch (e) {
    print("SAVE HIGH SCORE error: " + e.toString());
  }
}

Future<int?> readHighscore() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    int? highscore = prefs.getInt(key_ph_quiz_highscore);
    if (highscore == null) {
      await saveHighscore(0);
      highscore = 0;
    }
    return highscore;
  } catch (e) {
    print("SAVE HIGH SCORE error: " + e.toString());
  }
  return null;
}
