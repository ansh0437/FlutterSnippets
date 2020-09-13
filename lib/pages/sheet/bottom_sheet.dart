import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class BottomSheetPage extends BaseWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends BaseState<BottomSheetPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Tutorial tutorial;

  String text = "Please read the legal small print, and other information about the" +
      "eBook and Project Gutenberg at the bottom of this file.  Included is" +
      "important information about your specific rights and restrictions in" +
      "how the file may be used.  You can also find out about how to make a" +
      "donation to Project Gutenberg, and how to get involved.";

  void showInfoSheet() {
    showModalBottomSheet(
        context: _scaffoldKey.currentState.context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  "Info",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20.0),
                Flexible(
                    child: SingleChildScrollView(
                        child: Text(text + text + text + text)))
              ],
            ),
          );
        });
  }

  void showConfirmationSheet() {
    showModalBottomSheet(
        context: _scaffoldKey.currentState.context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Confirmation",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20.0),
                    Text(text),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Colors.blue,
                                onPressed: () {},
                                child: Text("Cancel",
                                    style: TextStyle(color: Colors.white)))),
                        SizedBox(width: 8.0),
                        Expanded(
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Colors.blue,
                                onPressed: () {},
                                child: Text("Yes",
                                    style: TextStyle(color: Colors.white)))),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  void showListSheet() {
    showModalBottomSheet(
        context: _scaffoldKey.currentState.context,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return Container(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Select Item",
                    style: TextStyle(fontSize: 24),
                  )),
              Flexible(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(Icons.ac_unit),
                        title: Text('List Item $index'),
                        subtitle: Text("List Description $index"),
                        onTap: () => {Navigator.pop(context)});
                  },
                ),
              )
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(tutorial.title),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ButtonTheme(
              minWidth: getWidth(),
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blue,
                onPressed: () => showInfoSheet(),
                child:
                    Text("Info Sheet", style: TextStyle(color: Colors.white)),
              ),
            ),
            ButtonTheme(
              minWidth: getWidth(),
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blue,
                onPressed: () => showConfirmationSheet(),
                child: Text("Confirmation Sheet",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            ButtonTheme(
              minWidth: getWidth(),
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.blue,
                onPressed: () => showListSheet(),
                child:
                    Text("List Sheet", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
