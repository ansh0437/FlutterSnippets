import 'package:flutter/material.dart';

final List colors = [
  Colors.red.shade500,
  Colors.blue.shade500,
  Colors.yellow.shade500,
  Colors.green.shade500,
  Colors.pink.shade500,
  Colors.purple.shade500,
  Colors.orange.shade500,
  Colors.grey.shade500,
  Colors.blueGrey.shade500,
  Colors.brown.shade500,
  Colors.cyan.shade500,
  Colors.indigo.shade500,
  Colors.teal.shade500,
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
  return TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey.shade700);
}
