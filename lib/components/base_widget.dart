import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseWidget extends StatefulWidget {}

abstract class BaseStatelessWidget extends StatelessWidget {}

abstract class BaseState<T extends BaseWidget> extends State<T> {
  AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Colors.purple.shade900,
      title: Text(title),
    );
  }

  void push(String routeName, {Object data}) {
    Navigator.of(context).pushNamed(routeName, arguments: data);
  }

  void popPush(String routeName) {
    Navigator.of(context).popAndPushNamed(routeName);
  }

  void pushClear(String routeName) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }
}