import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: Text(
          "Flutter Snippets",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
