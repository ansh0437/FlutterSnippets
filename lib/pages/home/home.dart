import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';

import 'home_list.dart';

class Home extends BaseWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  final String _title = "Flutter Snippets";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_title),
      backgroundColor: Colors.white,
      body: HomeListView(homeDelegate: _handleHomeDelegate),
    );
  }

  void _handleHomeDelegate(Tutorial tutorial) {
    push(tutorial.routeName, data: tutorial);
  }
}
