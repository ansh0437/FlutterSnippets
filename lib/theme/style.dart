import 'package:flutter/material.dart';

final List colors = [
  Colors.red,
  Colors.blue,
  Colors.yellow,
  Colors.green,
  Colors.pink,
  Colors.purple,
  Colors.orange,
  Colors.brown,
  Colors.cyan,
  Colors.indigo,
  Colors.teal,
];

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue.shade700,
    primaryColor: Colors.blue.shade500,
    accentColor: Colors.blueGrey,
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.blue,
    canvasColor: Colors.black,
  );
}

TextStyle boldTitle() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
}

TextStyle normalDescription() {
  return TextStyle(
      fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey.shade700);
}
