import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_kidz_exp/page/home.dart';
import 'package:happy_kidz_exp/utils.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage() // If the user has already verified their account then the home screen will be returned.
      : Scaffold(
          backgroundColor: Color(0xffFCFCB8),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'A verification email hs been sent to your email.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff07B300),
                        minimumSize: Size.fromHeight(55),
                      ),
                      icon: Icon(Icons.email, size: 32),
                      label: Text(
                        'Resend Email',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: canResendEmail ? sendVerificationEmail : null),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Color(0xff07B300),
                        minimumSize: Size.fromHeight(55),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () => FirebaseAuth.instance.signOut()),
                ),
              ],
            ),
          ),
        );
}
