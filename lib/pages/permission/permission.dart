import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends BaseWidget {
  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends BaseState<PermissionPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Tutorial tutorial;

  void _cameraPermission() async {
    bool permanentlyDenied = await Permission.camera.isPermanentlyDenied;
    bool restricted = await Permission.camera.isRestricted;
    String msg = '';
    if (permanentlyDenied || restricted) {
      /// Open app settings
      msg = 'Open app settings to give camera permission';
    } else {
      PermissionStatus status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
        msg = 'Camera permission granted';
      } else if (status == PermissionStatus.denied) {
        if (Platform.isIOS) {
          msg = 'Open app settings to give camera permission';
        } else {
          msg = 'Camera permission denied';
        }
      } else if (status == PermissionStatus.permanentlyDenied) {
        msg = 'Camera permission denied permanently';
      } else if (status == PermissionStatus.restricted) {
        msg = 'Camera permission restricted';
      }
    }
    SnackBar snackBar = SnackBar(content: Text(msg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _locationPermission() async {
    bool permanentlyDenied = await Permission.location.isPermanentlyDenied;
    bool restricted = await Permission.location.isRestricted;
    String msg = '';
    if (permanentlyDenied || restricted) {
      /// Open app settings
      msg = 'Open app settings to give location permission';
    } else {
      PermissionStatus status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        msg = 'Location permission granted';
      } else if (status == PermissionStatus.denied) {
        if (Platform.isIOS) {
          msg = 'Open app settings to give location permission';
        } else {
          msg = 'Location permission denied';
        }
      } else if (status == PermissionStatus.permanentlyDenied) {
        msg = 'Location permission denied permanently';
      } else if (status == PermissionStatus.restricted) {
        msg = 'Location permission restricted';
      }
    }
    SnackBar snackBar = SnackBar(content: Text(msg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
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
            buildRaisedButton("Camera", _cameraPermission),
            buildRaisedButton("Location", _locationPermission),
          ],
        ),
      ),
    );
  }

  Widget buildRaisedButton(title, onPress) {
    return ButtonTheme(
      minWidth: getWidth(),
      height: 40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.blue,
        onPressed: onPress,
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
