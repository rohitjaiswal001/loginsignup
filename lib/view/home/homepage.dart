import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:login/view/auth/loginpage.dart';
import 'package:login/view/home/remindersetting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/detail.dart';
import '../../helper/storage_helper.dart';

import '../../util/colors.dart';
import '../../util/email_pass_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _movingController = Get.put(MoveDetails());
  Color color = Colors.white;
  int colorIndex = 0;

  @override
  void initState() {
    cardcolor();

    super.initState();
  }

  cardcolor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      colorIndex = prefs.getInt('color')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    //color = _movingController.cardbackgroundcolor.read('colorname');
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                log("    count    ${MoveDetails().countbox.read('count')}");
                MoveDetails().countbox.erase();
                Get.to(ReminderSet());
                // do something
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              alignment: Alignment.center,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Card(
                      color: ColArr().colorArray[colorIndex],
                      //  _movingController.cardbackgroundcolor
                      //     .read('colorname'),
                      elevation: 1,
                      child: Text(
                          "${_movingController.movingController.text.toString()}  \n  ${_movingController.messageController.text.toString()}"),
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                log("color==============>${_movingController.cardbackgroundcolor.read('colorname')}");
                // StorageHelper.readData("email");
                log("=================count =========================count${MoveDetails().countbox.read('count')}");
                // log('=================Read=============> [Clicked] ${StorageHelper.readData("email")}');
                // StorageHelper.eraseData();

                // emailController.clear();
                // log('=================erase=============> [Clicked]${StorageHelper.readData("email")}');
                Get.offAll(LoginPage());
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );

//

//
  }
}
