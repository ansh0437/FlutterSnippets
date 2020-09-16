import 'package:flutter/material.dart';

Widget buildRaisedButton({title, width, onPress}) {
  return ButtonTheme(
    minWidth: width,
    height: 40,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.blue,
      onPressed: onPress,
      child: Text(title, style: TextStyle(color: Colors.white)),
    ),
  );
}
