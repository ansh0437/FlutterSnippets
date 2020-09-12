import 'package:flutter/material.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/components/base_widget.dart';

class Splash extends BaseWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BaseState<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      _openHomePage();
    });
  }

  void _openHomePage() {
    popPush(RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Center(
          child: GestureDetector(
        onTap: _openHomePage,
        child: Text(
          "Flutter Snippets",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
