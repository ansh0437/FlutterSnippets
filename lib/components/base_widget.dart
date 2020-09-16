import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseWidget extends StatefulWidget {}

abstract class BaseStatelessWidget extends StatelessWidget {}

abstract class BaseState<T extends BaseWidget> extends State<T> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Colors.purple.shade900,
      title: Text(title),
    );
  }

  Scaffold scaffoldBody({String title, Widget body}) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(title),
      body: body,
    );
  }

  double getWidth() => MediaQuery.of(context).size.width;

  double getHeight() => MediaQuery.of(context).size.height;

  void goBack() {
    Navigator.of(context).pop();
  }

  void push(String routeName, {Object data}) {
    Navigator.of(context).pushNamed(routeName, arguments: data);
  }

  void popPush(String routeName, {Object data}) {
    Navigator.of(context).popAndPushNamed(routeName, arguments: data);
  }

  void pushClear(String routeName, {Object data}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: data);
  }
}
