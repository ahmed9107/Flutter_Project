import 'package:flutter/material.dart';
import 'package:calculator/GUI/BMI_Screen.dart';
import 'package:flutter/services.dart';
import 'GUI/BMI_result.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light)
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: BmiScreen(),
    );
  }
}