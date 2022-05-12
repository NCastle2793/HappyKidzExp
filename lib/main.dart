import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:happy_kidz_exp/page/home.dart';
import 'package:happy_kidz_exp/page/verify_email.dart';
import 'package:happy_kidz_exp/utils.dart';
//import 'package:happy_kidz_exp/widget/login.dart';
import 'package:happy_kidz_exp/page/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        home: MainPage(),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xffFCFCB8),
        body: StreamBuilder<User?>(
          // StreamBuilder listens to exposed streams and returns widgets and catches snapshots of stream info.
          stream: FirebaseAuth.instance.authStateChanges(),
          // Calling authStateChanges method from FirebaseAuth package to see login changes.
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CircularProgressIndicator()); // Loading indicator for waiting.
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                      'Something went wrong')); // Error message for when something went wrong.
            } else if (snapshot.hasData) {
              return VerifyEmailPage(); // If logged in, return homepage.
            } else {
              return AuthPage(); // If logged out, return login page.
            }
          },
        ),
      );
}
