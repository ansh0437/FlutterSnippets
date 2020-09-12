import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/models/tutorial.dart';

class ImagePage extends BaseWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends BaseState<ImagePage> {
  Tutorial tutorial;

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: appBar(tutorial.title),
      body: Center(
        child: Image.network('https://picsum.photos/250?image=9'),
      ),
    );
  }
}
