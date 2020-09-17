import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class DrawerItem {
  DrawerItem({this.id, this.title});

  int id;
  String title;
}

class DrawerPage extends BaseWidget {
  final drawerItems = [
    DrawerItem(id: 1, title: "Page One"),
    DrawerItem(id: 2, title: "Page Two"),
    DrawerItem(id: 3, title: "Page Three")
  ];

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends BaseState<DrawerPage> {
  Tutorial tutorial;

  int _selectedDrawerIndex = 0;

  void _onClose() {
    goBack();
  }

  Widget _getDrawerItemBody(int index) {
    DrawerItem item = widget.drawerItems[index];
    return ContentPage(title: item.title, onClose: _onClose);

    /// For different page content use below code.
    // switch (index) {
    //   case 0:
    //     return ContentPage(title: item.title, onClose: _onClose);
    //   case 1:
    //     return ContentPage(title: item.title, onClose: _onClose);
    //   case 2:
    //     return ContentPage(title: item.title, onClose: _onClose);
    //   default:
    //     return Text('Page 404');
    // }
  }

  void _drawerItemTap(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(tutorial.title),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: Icon(Icons.person),
                accountName: Text("Himanshu Piplani"),
                accountEmail: Text('ansh0437@gmail.com')),
            Flexible(
                child: ListView.builder(
              itemCount: widget.drawerItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text(widget.drawerItems[index].title),
                  selected: index == _selectedDrawerIndex,
                  onTap: () => _drawerItemTap(index),
                );
              },
            ))
          ],
        ),
      ),
      body: _getDrawerItemBody(_selectedDrawerIndex),
    );
  }
}

class ContentPage extends StatelessWidget {
  ContentPage({this.title, this.onClose}) : super(key: ObjectKey(title));

  final String title;
  final Function onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        child: Text(title,
            style: TextStyle(
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.blue)),
        onTap: onClose,
      )),
    );
  }
}
