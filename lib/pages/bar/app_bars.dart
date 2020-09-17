import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/buttons.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class AppBarPage extends BaseWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends BaseState<AppBarPage> {
  Tutorial tutorial;

  int _appBarIndex = 0;

  Widget button(title, index) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: buildRaisedButton(
            title: title,
            width: getWidth(),
            onPress: () {
              setState(() {
                _appBarIndex = index;
              });
            }));
  }

  AppBar _barOne() {
    return AppBar(
      title: Text(tutorial.title),
      automaticallyImplyLeading: false,
    );
  }

  AppBar _getAppBar(int index) {
    switch (index) {
      case 1:
        return _barOne();
      default:
        return appBar(tutorial.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: _getAppBar(_appBarIndex),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              button("App Bar One", 1),
              button("App Bar Two", 2),
              button("App Bar Three", 3),
            ],
          ),
        ),
      ),
    );
  }
}
