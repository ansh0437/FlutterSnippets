import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class BottomPage extends BaseWidget {
  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends BaseState<BottomPage> {
  Tutorial tutorial;

  int _selectedIndex = 0;

  Future<bool> _onBackPressed() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    } else {
      goBack();
      return true;
    }
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return ContentPage(title: 'Home');
      case 1:
        return ContentPage(title: 'Chat');
      case 2:
        return ContentPage(title: 'Profile');
      case 3:
        return ContentPage(title: 'Settings');
      default:
        return Text('Page 404');
    }
  }

  void _itemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
        child: Scaffold(
          key: scaffoldKey,
          appBar: appBar(tutorial.title),
          body: _getBody(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text("Chat")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("Profile")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text("Settings")),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            onTap: _itemTap,
          ),
        ),
        onWillPop: _onBackPressed);
  }
}

class ContentPage extends StatelessWidget {
  ContentPage({this.title}) : super(key: ObjectKey(title));

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(title,
              style: TextStyle(
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue))),
    );
  }
}
