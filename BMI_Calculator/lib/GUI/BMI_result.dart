import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMIResult extends StatelessWidget {
  late final double result;
  late final bool gender;
  late final int age;
  late String conclusion;

  BMIResult({required this.result, required this.gender, required this.age});

  Text _conclusion () {
    if (result <= 18.5){
      return Text(
        'Under weight',
        style: TextStyle(
            color: Colors.yellow,
            fontSize: 45.0,
            fontWeight: FontWeight.bold),
      );
    }else if (18.5 < result && result <= 29.4){
      return Text(
        'Normal',
        style: TextStyle(
            color: Colors.green,
            fontSize: 60.0,
            fontWeight: FontWeight.bold),
      );
    }else{
      return Text(
        'Over weight',
        style: TextStyle(
            color: Colors.red,
            fontSize: 50.0,
            fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.angleLeft, color: Color(0xff797588)),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color(0xffe4e7fa),
        title: Text(
          'BMI Result:',
          style: TextStyle(color: Color(0xff797588)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Gender:',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Icon(
                                gender
                                    ? FontAwesomeIcons.mars
                                    : FontAwesomeIcons.venus,
                                color: gender
                                    ? Colors.lightBlueAccent
                                    : Color(0xfff7a4bf),
                                size: 60.0,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Color(0xffe4e7fa), blurRadius: 8)
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white, //isMale ? Color(0xff1c257f)
                            // :Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age:',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                '$age',
                                style: TextStyle(
                                    color: gender
                                        ? Colors.lightBlueAccent
                                        : Color(0xfff7a4bf),
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffe4e7fa), blurRadius: 8)
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                           'Your BMI is:',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.0,),
                          Text(
                            '${result.round()}',
                            style: TextStyle(
                              color: gender
                                  ? Colors.lightBlueAccent
                                  : Color(0xfff7a4bf),
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold),
                          ),
                        ]
                      ),
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffe4e7fa),
                              blurRadius: 8
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0,right: 15.0,bottom: 15.0,left: 15.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(child: _conclusion()),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe4e7fa),
                            blurRadius: 8
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}
