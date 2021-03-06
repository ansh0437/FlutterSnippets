import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_snippets/config/constants.dart';
import 'package:flutter_snippets/pages/alert/alert_dialog.dart';
import 'package:flutter_snippets/pages/back/back.dart';
import 'package:flutter_snippets/pages/bar/app_bars.dart';
import 'package:flutter_snippets/pages/data/data.dart';
import 'package:flutter_snippets/pages/navigation/bottom.dart';
import 'package:flutter_snippets/pages/navigation/drawer.dart';
import 'package:flutter_snippets/pages/file/file_picker.dart';
import 'package:flutter_snippets/pages/form/form.dart';
import 'package:flutter_snippets/pages/home/home.dart';
import 'package:flutter_snippets/pages/image/image.dart';
import 'package:flutter_snippets/pages/image/image_chooser.dart';
import 'package:flutter_snippets/pages/pager/pager.dart';
import 'package:flutter_snippets/pages/permission/permission.dart';
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
      RouteName.permission: (_) => PermissionPage(),
      RouteName.imageChooser: (_) => ImageChooser(),
      RouteName.filePicker: (_) => FilePickerPage(),
      RouteName.alertDialog: (_) => AlertDialogPage(),
      RouteName.drawer: (_) => DrawerPage(),
      RouteName.bottom: (_) => BottomPage(),
      RouteName.pager: (_) => Pager(),
      RouteName.data: (_) => DataPage(),
      RouteName.appBar: (_) => AppBarPage(),
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
