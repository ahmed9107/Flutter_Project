import 'package:flutter/material.dart';
import "package:flutter_icons/flutter_icons.dart";


class LoginScreen extends StatefulWidget {
  //static const id = "loginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userController = new TextEditingController();
  bool _showPassword = false;

  void _github(){
    print('Github');
  }
  void _google(){
    print('Google');
  }
  void _face(){
    print('Facebook');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(22.0),
          height: size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40.0),
                Center(
                  child: Image.asset('img/logo.png', width: size.width / 3),
                ),
                SizedBox(height: 24.0),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text('Login with:',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(height: 24.0),
                TextField(
                  style:
                      TextStyle(fontSize: 18.0, color: Colors.deepOrangeAccent),
                  controller: _userController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person,
                          color: Colors.deepOrangeAccent, size: 32.0),
                      hintText: 'Username Or Email'),
                ),
                TextField(
                  obscureText: !this._showPassword,
                  decoration: InputDecoration(
                    labelText: 'password',
                    icon: Icon(
                      Icons.security,
                      color: Colors.deepOrangeAccent,
                      size: 32.0,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: this._showPassword
                            ? Colors.deepOrangeAccent
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => this._showPassword = !this._showPassword);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return Colors.deepOrangeAccent;
                      },
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 24.0),
                Text('Or Sign in with',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: _face,
                      child: Icon(
                        Zocial.facebook,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    OutlinedButton(
                      onPressed: _google,
                      child: Icon(
                        Zocial.google,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    OutlinedButton(
                      onPressed: _github,
                      child: Icon(
                        Zocial.github,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}