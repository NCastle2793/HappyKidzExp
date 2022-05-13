import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:happy_kidz_exp/widget/custom_navbar.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final user =
        FirebaseAuth.instance.currentUser!; // Used to access user info.

    return Scaffold(
      backgroundColor: Color(0xffFCFCB8),
      appBar: AppBar(
        backgroundColor: Color(0xff07B300),
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signed In as',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              user.email!, // Displays user email.
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff07B300),
                  minimumSize: Size.fromHeight(55),
                ),
                icon: Icon(Icons.arrow_back, size: 32),
                label: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => FirebaseAuth.instance
                    .signOut(), // Calling Firebase signOut method from Firebase auth package.
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
