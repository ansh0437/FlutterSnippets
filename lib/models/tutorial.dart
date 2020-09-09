import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/theme/style.dart';

class Tutorial {
  String title;
  String description;
  String routeName;
  Color color;

  Tutorial(this.title, this.description, this.routeName, this.color);

  static List<Tutorial> getList() {
    Random random = new Random();
    int length = colors.length - 1;
    return [
      Tutorial(
          "Hardware Back",
          "Detect device hardware/toolbar back button(hardware button only in android).",
          RouteName.back,
          colors[random.nextInt(length)]),
      // Tutorial("Login", "Simple login form with email & password fields.",
      //     RouteName.login, colors[random.nextInt(length)]),
      // Tutorial("Url Image", "Load image from url.", RouteName.urlImage,
      //     colors[random.nextInt(length)]),
    ];
  }
}
