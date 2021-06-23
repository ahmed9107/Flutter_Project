import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_icons/flutter_icons.dart";


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool _showPassword = false;

  String _name;
  String _phoneNumber;
  String _email;

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

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
    return Scaffold(
          body: Container(
            padding: EdgeInsets.all(22.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text('Create you account:',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      textAlign: TextAlign.center
                  ),
                  SizedBox(height: 24.0),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.person,color: Colors.deepOrangeAccent,
                        size: 32.0,),
                      hintText: 'Enter Your Name',
                      labelText: 'Name *',
                    ),
                    onSaved: (String value) {
                      this._name = value;
                      print('name=$_name');
                    },
                    validator: _validateName,
                  ),
                  const SizedBox(height: 24.0),
                  // "Phone number" form.
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.phone,color: Colors.deepOrangeAccent,
                        size: 32.0,),
                      hintText: 'Your phone number',
                      labelText: 'Phone Number *',
                      prefixText: '+212',
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (String value) {
                      this._phoneNumber = value;
                      print('phoneNumber=$_phoneNumber');
                    },
                    // TextInputFormatters are applied in sequence.
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  // "Email" form.
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.email,color: Colors.deepOrangeAccent,
                        size: 32.0,),
                      hintText: 'Your email address',
                      labelText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      this._email = value;
                      print('email=$_email');
                    },
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text('Or Sign Up with:',
                      style: TextStyle(
                        color: Colors.deepOrangeAccent,
                      ),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
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
                ],
              ),
            ),
          ),
        );
  }
}

