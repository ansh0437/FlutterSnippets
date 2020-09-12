import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class Back extends BaseWidget {
  @override
  _BackState createState() {
    return _BackState();
  }
}

class _BackState extends BaseState<Back> {
  Tutorial tutorial;

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: appBar(tutorial.title),
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Back Detector...", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

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
}
