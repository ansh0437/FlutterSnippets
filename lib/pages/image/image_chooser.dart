import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/buttons.dart';
import 'package:flutter_snippets/models/tutorial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageChooser extends BaseWidget {
  @override
  _ImageChooserState createState() => _ImageChooserState();
}

class _ImageChooserState extends BaseState<ImageChooser> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Tutorial tutorial;
  File _image;

  /* 
  Add following in Info.plist
  <key>NSCameraUsageDescription</key>
  <string>Allow App to use Camera for uploading Photos.</string>
  */
  void _cameraChooser() async {
    try {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        SnackBar snackBar =
            SnackBar(content: Text("Camera chooser returned null"));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } catch (err) {
      print(err);
    }
  }

  /*
  Add following in Info.plist
  <key>NSPhotoLibraryAddUsageDescription</key>
  <string>Allow photo to save photo</string>
  <key>NSPhotoLibraryUsageDescription</key>
  <string>Allow photo to save photo</string>
  <key>Photo Library Usage Description</key>
  <string>Allow App to use Photo Library for uploading Photos.</string>
  */
  void _galleryChooser() async {
    try {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        SnackBar snackBar =
            SnackBar(content: Text("Gallery chooser returned null"));
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } catch (err) {
      print(err);
    }
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
            buildRaisedButton(
                title: "Camera", width: getWidth(), onPress: _cameraChooser),
            buildRaisedButton(
                title: "Gallery", width: getWidth(), onPress: _galleryChooser),
            _image == null ? Text('No image selected.') : Image.file(_image),
          ],
        ),
      ),
    );
  }
}
