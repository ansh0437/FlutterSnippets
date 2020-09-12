import 'package:flutter/material.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/theme/style.dart';

class Tutorial {
  String title;
  String description;
  String routeName;
  MaterialColor color;

  Tutorial(this.title, this.description, this.routeName, this.color);

  static List<Tutorial> getList() {
    // Random random = new Random();
    // int length = colors.length - 1;
    return [
      Tutorial(
          "Back Detector",
          "Detect device hardware/toolbar back button click(hardware button only in android).",
          RouteName.back,
          colors[0]),
      Tutorial("Simple Form", "Simple form with basic fields.", RouteName.form,
          colors[1]),
      Tutorial(
          "Url Image", "Load image from url.", RouteName.urlImage, colors[2]),
      Tutorial(
          "Bottom Sheet",
          "Different types of bottom sheets for displaying data or asking confirmation from user.",
          RouteName.bottomSheet,
          colors[3]),
      Tutorial("Image Chooser", "Choose image from camera or gallery options.",
          RouteName.imageChooser, colors[4]),
    ];
  }
}
