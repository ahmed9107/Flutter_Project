import 'package:flutter/material.dart';
import 'package:my_login/GUI/loginSignupScreen.dart';

class WelcomeScreen extends StatefulWidget{
  //static const id = 'welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{

  @override
  void initState(){
    Future.delayed(const Duration(seconds: 10),(){
      Navigator.pushNamed(context, '/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: Colors.white70,
          height: size.height, // take the height of the device whatever it is
          width: double.infinity, // take the height of the device whatever it is
          child: Stack(
            children: [
              Center(
                child: Image.asset('img/logo.png', width: size.width/2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}