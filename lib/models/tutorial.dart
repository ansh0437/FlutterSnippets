import 'package:flutter/material.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/theme/style.dart';

class Tutorial {
  String title;
  String description;
  String routeName;
  MaterialColor color;

  Tutorial(this.title, this.description, this.routeName, this.color);

  // factory Tutorial.fromJson(Map<String, dynamic> json) {
  //   return Tutorial(
  //     json['title'] as String,
  //     json['description'] as String,
  //     json['routeName'] as String,
  //     colors[json['colorIndex'] as int],
  //   );
  // }

  static List<Tutorial> getList() {
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
      Tutorial(
          "Permissions",
          "Different permissions used in android/iOS applications.",
          RouteName.permission,
          colors[4]),
      Tutorial("Image Chooser", "Choose image from camera or gallery options.",
          RouteName.imageChooser, colors[5]),
      Tutorial("File Picker", "Choose different types of files from device.",
          RouteName.filePicker, colors[6]),
      Tutorial(
          "Alert Dialog",
          "Different types of alert dialogs for displaying data or asking confirmation from user.",
          RouteName.alertDialog,
          colors[7]),
      Tutorial(
          "Drawer",
          "Navigation drawer for opening different screens in single container.",
          RouteName.drawer,
          colors[8]),
      Tutorial(
          "Bottom Navigation",
          "Bottom navigation for opening different screens in single container.",
          RouteName.bottom,
          colors[9]),
      Tutorial("View Pager", "Different type of view pager with animations.",
          RouteName.pager, colors[10]),
      Tutorial(
          "Data Manipulation",
          "Passing data to next screen. Returning data to previous screen.",
          RouteName.data,
          colors[0]),
      Tutorial("App Bars", "Custom app bars for different scenarios.",
          RouteName.appBar, colors[1]),
    ];
  }
}

/// Google Maps, Firebase Authentication,
/// Firebase Push Notifications, Api Calling, Json Parsing,
/// In-App Camera, Fingerprint Authentication, Database, Open External Apps
/// Custom AppBar
