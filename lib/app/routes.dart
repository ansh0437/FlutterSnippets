import 'package:flutter/widgets.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/pages/back/back.dart';
import 'package:flutter_snippets/pages/home/home.dart';
import 'package:flutter_snippets/pages/splash/splash.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  RouteName.splash: (BuildContext context) => Splash(),
  RouteName.home: (BuildContext context) => Home(),
  RouteName.back: (BuildContext context) => Back(),
};
