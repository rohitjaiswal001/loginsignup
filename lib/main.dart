import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/app_routes/page_routes.dart';
import 'package:login/helper/storage_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/view/Auth/loginpage.dart';
import 'package:login/view/home/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app_routes/page_generated.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  

  await GetStorage.init();


 // TODO: Request permission
 final messaging = FirebaseMessaging.instance;

final settings = await messaging.requestPermission(
 alert: true,
 announcement: false,
 badge: true,
 carPlay: false,
 criticalAlert: false,
 provisional: true,
 sound: true,
);

 if (kDebugMode) {
   print('Permission granted: ${settings.authorizationStatus}');
 }


 // TODO: Register with FCM
 // It requests a registration token for sending messages to users from your App server or other trusted server environment.
String? token = await messaging.getToken();

if (kDebugMode) {
  print('Registration Token=$token');
}




 // TODO: Set up foreground message handler
 // TODO: Set up background message handler

  
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

///----------------------///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var onAuthStateChanged;
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.grey),
      //  home: StreamBuilder(
      //   stream: FirebaseAuth.instance.onAuthStateChanged,
      //   builder: (ctx, userSnapshot) {
      //     if (userSnapshot.hasData) {
      //       return HomePage();
      //     } else if (userSnapshot.hasError) {
      //       return CircularProgressIndicator();
      //     }
      //     return LoginPage();
      //   },),
      initialRoute: StorageHelper.readData("email").toString().isEmpty
          ? PageRoutes.reminderset
          : PageRoutes.reminderset,

      // home: 1 == 2 ? LoginPage() : HomePage(),
      // getPages: getPages,
      onGenerateRoute: PageGenerated.generateRoute,
    );
  }
}
