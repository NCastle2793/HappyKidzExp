import 'package:flutter/material.dart';
import 'package:happy_kidz_exp/widget/custom_navbar.dart';

class UserProfile extends StatelessWidget {
  static const String routeName = '/user';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => UserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCB8),
      appBar: AppBar(
        backgroundColor: Color(0xff07B300),
        title: Text('Profile'),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
