import 'package:flutter/material.dart';
import 'package:my_login/GUI/WelcomeScreen.dart';
import 'package:my_login/GUI/LoginSignupScreen.dart';
import 'package:my_login/GUI/SignupScreen.dart';

void main(){
  runApp(MaterialApp(
    home: myApp(),
  ));
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed Azami',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}
