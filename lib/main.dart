import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/app_routes/page_routes.dart';
import 'package:login/helper/storage_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app_routes/page_generated.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

///----------------------///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.grey),
      //
      initialRoute: StorageHelper.readData("email").toString().isEmpty
          ? PageRoutes.login
          : PageRoutes.login,

      // home: 1 == 2 ? LoginPage() : HomePage(),
      // getPages: getPages,
      onGenerateRoute: PageGenerated.generateRoute,
    );
  }
}
