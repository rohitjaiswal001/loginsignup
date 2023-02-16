import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/view/auth/loginpage.dart';
import 'package:login/view/home/remindersetting.dart';

import '../../helper/storage_helper.dart';

import '../../util/email_pass_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                Get.to(ReminderSet());
                // do something
              },
            ),
          )
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            StorageHelper.readData("email");

            log('=================Read=============> [Clicked] ${StorageHelper.readData("email")}');
            StorageHelper.eraseData();

            emailController.clear();
            log('=================erase=============> [Clicked]${StorageHelper.readData("email")}');
            Get.offAll(LoginPage());
          },
          child: Text("Logout"),
        ),
      ),
    );

//

//
  }
}
