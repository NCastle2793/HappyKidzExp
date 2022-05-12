import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:happy_kidz_exp/page/home.dart';
import 'package:happy_kidz_exp/widget/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(), // The home page will show whatever widget is in the wrapper.
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xffFCFCB8),
        body: StreamBuilder<User?>( // StreamBuilder listens to exposed streams and returns widgets and catches snapshots of stream info.
          stream: FirebaseAuth.instance.authStateChanges(), // Calling authStateChanges method from FirebaseAuth package to see login changes.
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage(); // If logged in, return homepage.
            } else {
              return LoginWidget(); // If logged out, return login page.
            }
          },
        ),
      );
}
