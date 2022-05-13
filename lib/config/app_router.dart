import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_kidz_exp/page/home.dart';
import 'package:happy_kidz_exp/page/user_profile.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case '/user':
        return UserProfile.route();
      case UserProfile.routeName:
        return UserProfile.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: Text('Error')),
        ),
    );
  }
}