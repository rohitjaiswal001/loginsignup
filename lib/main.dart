import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/route.dart';
import 'package:login/view/homepage.dart';

import 'view/loginpage.dart';

void main() {
  runApp(const MyApp());
}

///----------------------///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //
      //
      theme: ThemeData(primarySwatch: Colors.grey),
      //
      // home: LoginPage(),

      home: LoginPage().storage == null ? LoginPage() : const HomePage(),
      getPages: getPages,
    );
  }
}
