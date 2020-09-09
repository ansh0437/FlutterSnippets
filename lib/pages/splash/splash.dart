import 'package:flutter/material.dart';
import 'package:flutter_snippets/config/constants.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _openHomePage() {
    Navigator.popAndPushNamed(context, RouteName.home);
    // Navigator.pushNamedAndRemoveUntil(
    //     context, RouteName.home, (Route<dynamic> route) => false);
    // Navigator.pushNamed(context, RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
          child: GestureDetector(
        onTap: _openHomePage,
        child: Text(
          "Flutter Snippets",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      )),
    );
  }
}
