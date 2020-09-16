import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/buttons.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class AlertDialogPage extends BaseWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends BaseState<AlertDialogPage> {
  Tutorial tutorial;

  String text = "Please read the legal small print, and other information about the" +
      "eBook and Project Gutenberg at the bottom of this file.  Included is" +
      "important information about your specific rights and restrictions in" +
      "how the file may be used.  You can also find out about how to make a" +
      "donation to Project Gutenberg, and how to get involved.";

  void _infoAlert() {
    showDialog(
      context: context,
      builder: (context) => new Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: Consts.avatarRadius + Consts.padding,
                bottom: Consts.padding,
                left: Consts.padding,
                right: Consts.padding,
              ),
              margin: EdgeInsets.only(top: Consts.avatarRadius),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Consts.padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Text(
                    "Info",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // To close the dialog
                      },
                      child: Text("Ok"),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: Consts.padding,
              right: Consts.padding,
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: Consts.avatarRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _infoAlert2() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0.0,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text("Info",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 24))),
                        ),
                        IconButton(
                            padding: EdgeInsets.only(top: 10),
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(10), child: Text(text)),
                    Padding(
                        padding: EdgeInsets.only(right: 10, bottom: 10),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Okay",
                                    style: TextStyle(color: Colors.white))))),
                  ],
                ),
              ));
        });
  }

  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return scaffoldBody(
        title: tutorial.title,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              buildRaisedButton(
                  title: "Info Alert", width: getWidth(), onPress: _infoAlert),
              SizedBox(height: 10),
              buildRaisedButton(
                  title: "Info Alert 2",
                  width: getWidth(),
                  onPress: _infoAlert2)
            ],
          ),
        ));
  }
}
