import 'package:get/get.dart';
import 'package:login/view/forgetpass.dart';
import 'package:login/view/homepage.dart';
import 'package:login/view/signup.dart';

import 'view/loginpage.dart';

class Routes {
  static String login = '/login';
  static String signup = '/signup';
  static String home = '/home';
  static String forgetpass = '/forgetpass';
}

final getPages = [
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => Signup(),
  ),
  GetPage(
    name: Routes.home,
    page: () => HomePage(),
  ),
  GetPage(
    name: Routes.forgetpass,
    page: () => ForgetPass(),
  ),
];
