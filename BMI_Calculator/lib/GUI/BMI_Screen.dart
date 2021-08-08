import 'dart:math';
import 'package:calculator/GUI/BMI_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  bool isMale = true;
  double height = 100.0;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Color(0xffe4e7fa),
        title: Text(
            'BMI Calculator',
            style: TextStyle(
            color: Color(0xff797588)
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 60.0,
                                color: isMale ? Colors.lightBlueAccent : Color(0xff797588),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    color: isMale ? Colors.lightBlueAccent : Color(0xff797588),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: isMale ? Colors.lightBlueAccent : Color(0xffe4e7fa),
                                spreadRadius: 0.5,
                                blurRadius: isMale ? 6 : 10
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white, //isMale ? Color(0xff1c257f)
                            // :Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.venus,
                                size: 60.0,
                                color: isMale ? Color(0xff797588) : Color(0xfff7a4bf),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    color: isMale ? Color(0xff797588) : Color(0xfff7a4bf),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: isMale ? Color(0xffe4e7fa) : Color(0xfff7a4bf),
                                    blurRadius: isMale ? 10 : 6
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white
                          ),
                        ),
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
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: TextStyle(
                                  color: Color(0xff797588),
                                  fontSize: 42.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Slider(
                            activeColor: isMale ? Colors.lightBlueAccent : Colors.pink[200],
                            inactiveColor: Colors.grey[300],
                            value: height,
                            max: 220.0,
                            min: 80.0,
                            onChanged: (value){
                              setState(() {
                                height = value;
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffe4e7fa),
                            blurRadius: 10
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 2,),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Colors.blueGrey
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  color: Color(0xff797588),
                                  fontSize: 54.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: Color(0xffeeeeee),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.blueGrey,
                                    ),
                                    mini: true,
                                    heroTag: 'weight-',
                                    onPressed: (){
                                      if (weight <= 5){
                                        setState(() {
                                          weight = 5;
                                        });
                                      } else {
                                        setState(() {
                                          weight--;
                                        });
                                      }
                                    }
                                ),
                                SizedBox(width: 5.0,),
                                FloatingActionButton(
                                    backgroundColor: Color(0xffeeeeee),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.blueGrey,
                                    ),
                                    mini: true,
                                    heroTag: 'weight+',
                                    onPressed: (){
                                      setState(() {
                                        weight ++;
                                      });
                                    }
                                )
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffe4e7fa),
                                  blurRadius: 10
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
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
                              'AGE',
                              style: TextStyle(
                                  color: Colors.blueGrey
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  color: Color(0xff797588),
                                  fontSize: 54.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: Color(0xffeeeeee),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.blueGrey,
                                    ),
                                    mini: true,
                                    heroTag: 'age-',
                                    onPressed: (){
                                      if (age <= 1){
                                        setState(() {
                                          age = 1;
                                        });
                                      } else {
                                        setState(() {
                                          age--;
                                        });
                                      }
                                    }
                                ),
                                SizedBox(width: 5.0,),
                                FloatingActionButton(
                                    backgroundColor: Color(0xffeeeeee),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.blueGrey,
                                    ),
                                    mini: true,
                                    heroTag: 'age+',
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    }
                                )
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffe4e7fa),
                                  blurRadius: 10
                              )
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
          Container(
            width: double.infinity,
            color: isMale ? Colors.lightBlueAccent : Colors.pink[200],
            child: MaterialButton(
              onPressed: (){
                var result = weight/pow(height/100,2);
                print(result.round());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (
                            context)=>BMIResult(
                          age: age,
                          gender: isMale,
                          result: result,
                        )
                    )
                );
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
