import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG_Color Picker',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Map<String, Color> colors = {
    'red': Colors.red,
    'blue': Colors.blue,
    'purple': Colors.purple,
    'teal': Colors.teal,
    'brown': Colors.brown,
    'orange': Colors.orange,
    'yellow': Colors.yellow,
    'grey': Colors.grey,
    'pink': Colors.pink,
    'green': Colors.green
  };

  Color selectedColor;

  _setColor(String colorName, Color color){
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BG Color Picker',
          style: TextStyle(
            color: selectedColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(22.0),
        height: size.height,
        width: double.infinity,
        color: selectedColor ?? Colors.black,
        //margin: EdgeInsets.symmetric(vertical: 20.0),
        //height: 200.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //scrollDirection: Axis.horizontal,
            children: [
              for (var entry in colors.entries)
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: entry.value,
                        minimumSize: Size(300.0, 60.0)
                    ),
                    child: Text(''),
                    onPressed: () => _setColor(entry.key, entry.value),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}