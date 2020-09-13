import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/config/strings.dart';
import 'package:flutter_snippets/models/tutorial.dart';

import 'home_list.dart';

class Home extends BaseWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(Strings.appName),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return {'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: HomeListView(homeDelegate: _handleHomeDelegate),
    );
  }

  void _handleHomeDelegate(Tutorial tutorial) {
    push(tutorial.routeName, data: tutorial);
  }
}
