import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/config/strings.dart';
import 'package:flutter_snippets/models/tutorial.dart';

import 'dart:convert';

import 'home_list.dart';

class Home extends BaseWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  List<Tutorial> _tutorialList = Tutorial.getList();

  // @override
  // void initState() {
  //   super.initState();
  // loadData();
  // }

  // void loadData() {
  // DefaultAssetBundle.of(context)
  //     .loadString(Strings.tutorialJsonPath)
  //     .then((value) {
  //   setState(() {
  //     final parsed = json.decode(value);
  //     final list =
  //         parsed.map<Tutorial>((json) => Tutorial.fromJson(json)).toList();
  //     _tutorialList = list;
  //   });
  // }).catchError((err) {
  //   print(err);
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text(Strings.appName),
        actions: <Widget>[
          PopupMenuButton<String>(
            // onSelected: (value) => loadData(),
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
      body: HomeListView(
          tutorialList: _tutorialList, homeDelegate: _handleHomeDelegate),
    );
  }

  void _handleHomeDelegate(Tutorial tutorial) {
    push(tutorial.routeName, data: tutorial);
  }
}
