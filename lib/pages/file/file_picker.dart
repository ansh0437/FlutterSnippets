import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerPage extends BaseWidget {
  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}

class _FilePickerPageState extends BaseState<FilePickerPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Tutorial tutorial;
  String fileData = "";

  void _selectFile() async {
    if (Platform.isAndroid) {
      _checkStoragePermission();
    } else {
      _filePicker();
    }
  }

  void _checkStoragePermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      _filePicker();
    } else {
      SnackBar snackBar = SnackBar(content: Text("Storage permission needed."));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  void _filePicker() async {
    try {
      FilePickerResult pickedFile = await FilePicker.platform.pickFiles();
      // .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      if (pickedFile != null) {
        PlatformFile file = pickedFile.files.first;
        setState(() {
          fileData =
              "File Name :- ${file.name}\nFile Extension :- ${file.extension}" +
                  "\nFile Size :- ${file.size}\nFile Path :- ${file.path}";
        });
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
            buildRaisedButton("Select File", _selectFile),
            SizedBox(height: 20),
            Text(fileData),
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
