import 'package:flutter/material.dart';
import 'package:flutter_snippets/models/tutorial.dart';

import 'home_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Snippets"),
      ),
      backgroundColor: Colors.white,
      body: HomeListView(homeDelegate: _handleHomeDelegate),
    );
  }

  void _handleHomeDelegate(Tutorial tutorial) {
    Navigator.of(context).pushNamed(tutorial.routeName);
  }
}
