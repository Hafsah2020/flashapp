import 'package:flutter/material.dart';
import 'package:flashapp/screens/chat_screen.dart';
import '../components.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// class _LoginScreenState extends State<LoginScreen> {
//   static String id = 'Login Screen';
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Material(
//         elevation: 5.0,
//         color: Colors.blueAccent,
//         borderRadius: BorderRadius.circular(30.0),
//         child: MaterialButton(
//           onPressed: () async {
//             setState(() {
//               loading = true;
//             });
//             try {
//               await Future.delayed(Duration(seconds: 4), () {});
//             } catch (e) {
//               print(e);
//             }
//             setState(() {
//               loading = false;
//             });
//           },
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(
//             loading ? 'loading' : 'g',
//              but it worked here
//           ),
//         ),
//       ),
//     ));
//   }
//}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String pw = '';
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String buttonText = 'login';
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
                      try {
                        setState(() {
                          loading = true;
                          buttonText = 'loading';
                        });
                        final existingUser =
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: pw);
                        if (existingUser != null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                          print(loading);
                        }
                      } catch (e) {
                        print(loading);
                        print(e);
                      }
                      setState(() {
                        loading = false;
                        buttonText = 'login';
                      });
                      print(loading);
                    },
                    text: buttonText
                    // text: loading ? 'loading' : 'login',
                    // loading has been set back to false? can't explain
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
