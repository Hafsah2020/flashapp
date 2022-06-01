import 'package:flashapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String pw = '';
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    //Do something with the user input.
                    email = value;
                  },
                  decoration:
                      ktextInputDecoration.copyWith(hintText: 'Email address'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      //Do something with the user input.
                      pw = value;
                    },
                    decoration:
                        ktextInputDecoration.copyWith(hintText: 'password')),
                SizedBox(
                  height: 24.0,
                ),
                ClickButton(
                  color: Colors.lightBlueAccent,
                  function: () async {
                    setState(() {
                      loading = true;
                    });
                    try {
                      final existingUser =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: pw);
                      if (existingUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  text: 'Log In',
                ),
                Text(loading ? 'loading' : '')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
