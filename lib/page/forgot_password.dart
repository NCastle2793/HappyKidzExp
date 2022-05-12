import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_kidz_exp/utils.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xffFCFCB8),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Recieve an email to\nreset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  // Controller attached to text field.
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff07B300),
                        minimumSize: Size.fromHeight(55),
                      ),
                      icon: Icon(Icons.email_outlined),
                      label: Text(
                        'Reset Password',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          ),
        ),
      );
}
