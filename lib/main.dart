import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/app_routes/page_routes.dart';
import 'package:login/helper/storage_helper.dart';
import 'package:login/view/auth/loginpage.dart';
import 'package:login/view/home/homepage.dart';

import 'app_routes/page_generated.dart';

void main() async {
  await GetStorage.init(); //get storage initialization
  runApp(const MyApp());
}

///----------------------///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.grey),
      //
      initialRoute: StorageHelper.readData("email").toString().isEmpty
          ? PageRoutes.reminderset
          : PageRoutes.reminderset,

      // home: 1 == 2 ? LoginPage() : HomePage(),
      // getPages: getPages,
      onGenerateRoute: PageGenerated.generateRoute,
    );
  }
}
