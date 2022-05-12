//import 'package:email_validator?email_Validator.dart;';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_kidz_exp/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
          controller: passwordController,
          // Controller attached to text field.
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
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {} // Calling signUp method.
          ),
        ),
        SizedBox(height: 24),
        RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 15),
            text: 'Already have an account?  ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignIn,
                text: 'Log in',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.green,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Future signIn() async {
    // Loading indicator for sign in.
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        // Calling signInWithEmailAndPassword method from FirebaseAuth package.
        email: emailController.text.trim(),
        // Gets input from the email text field via controllers.
        password: passwordController.text
            .trim(), // Gets input from the password text field via controllers.
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}