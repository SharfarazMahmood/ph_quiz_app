import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ph_quiz/app/routes/app_pages.dart';

import 'app/modules/HomePage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:const MaterialApp(
        title: 'PH Quiz',
        debugShowCheckedModeBanner: false,
        home:  HomePage(),
      ),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
