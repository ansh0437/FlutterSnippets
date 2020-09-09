import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Back extends StatefulWidget {
  @override
  _BackState createState() {
    return _BackState();
  }
}

class _BackState extends State<Back> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: Text('Back call detected.'),
        actions: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("Cancel"),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("Go Back"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Back"),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Back Detector..."),
        ),
      ),
    );
  }
}
