import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/pages/back/back.dart';
import 'package:flutter_snippets/pages/form/form.dart';
import 'package:flutter_snippets/pages/home/home.dart';
import 'package:flutter_snippets/pages/image/image.dart';
import 'package:flutter_snippets/pages/sheet/bottom_sheet.dart';
import 'package:flutter_snippets/pages/splash/splash.dart';

class Router {
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      RouteName.splash: (BuildContext context) => Splash(),
      RouteName.home: (context) => Home(),
      RouteName.back: (_) => Back(),
      RouteName.form: (_) => BasicForm(),
      RouteName.urlImage: (_) => ImagePage(),
      RouteName.bottomSheet: (_) => BottomSheetPage(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
