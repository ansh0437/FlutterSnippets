import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snippets/models/tutorial.dart';
import 'package:flutter_snippets/theme/style.dart';

/// Home List Item Click Listener
typedef void HomeDelegate(Tutorial tutorial);

/// Home List View
class HomeListView extends StatelessWidget {
  HomeListView({this.homeDelegate}) : super();

  final _tutorialList = Tutorial.getList();
  final HomeDelegate homeDelegate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _tutorialList.map((Tutorial tutorial) {
        return HomeListCell(
          tutorial: tutorial,
          homeDelegate: homeDelegate,
        );
      }).toList(),
    );
  }
}

/// Home List View Cell
class HomeListCell extends StatelessWidget {
  HomeListCell({this.tutorial, this.homeDelegate}) : super();

  final Tutorial tutorial;
  final HomeDelegate homeDelegate;

  void _handleCardTap() {
    homeDelegate(tutorial);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleCardTap,
      child: Card(
        margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: tutorial.color)),
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(tutorial.title, style: boldTitle()),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Text(tutorial.description, style: normalDescription()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
