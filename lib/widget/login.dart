import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth_email/main.dart';
//import 'package:firebase_auth_email/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // Creating email and password controllers so that input from text fields can be used.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            TextField(
              controller: emailController, // Controller attached to text field.
              cursorColor: Colors.black,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 4),
            TextField(
              controller: passwordController, // Controller attached to text field.
              cursorColor: Colors.black,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff07B300),
                  minimumSize: Size.fromHeight(55),
                ),
                icon: Icon(Icons.lock_open, size: 32),
                label: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signIn, // Calling signIn method from Firebase auth package.
              ),
            ),
          ],
        ),
      );

  Future signIn() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword( // Calling signInWithEmailAndPassword method from FirebaseAuth package.
      email: emailController.text.trim(), // Gets input from the email text field via controllers.
      password: passwordController.text.trim(), // Gets input from the password text field via controllers.
    );
  }
}
