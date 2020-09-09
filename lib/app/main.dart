import 'package:flutter/material.dart';
import 'package:flutter_snippets/app/routes.dart';
import 'package:flutter_snippets/config/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Snippets',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteName.splash,
      routes: routes,
    );
  }
}
