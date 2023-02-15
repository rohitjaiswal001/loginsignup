import 'package:flutter/cupertino.dart';

import 'package:login/view/auth/loginpage.dart';

import '../view/home/homepage.dart';
import 'page_routes.dart';
import 'package:login/view/home/remindersetting.dart';

class PageGenerated {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widgetScreen;
    switch (settings.name) {
      case PageRoutes.login:
        widgetScreen = LoginPage();
        break;
      case PageRoutes.home:
        widgetScreen = HomePage();
        break;

      case PageRoutes.reminderset:
        widgetScreen = ReminderSet();
        break;

      default:
        widgetScreen = LoginPage();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }
}
