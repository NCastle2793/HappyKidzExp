import 'package:flutter/material.dart';
import 'package:happy_kidz_exp/page/user_profile.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xffB4FC20),
      child: Container(
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              }),
          IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/user');
              }),
        ]),
      ),
    );
  }
}
