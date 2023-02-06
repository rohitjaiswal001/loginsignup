import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/common_controller.dart';
import 'package:login/view/loginpage.dart';

import '../helper/storage_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () {
              StorageHelper.readData("email");

              log('=================Read=============> [Clicked]');
              StorageHelper.eraseData();

              StorageHelper.readData("email");
              log('=================erase=============> [Clicked]');
              Get.offAll(LoginPage());
            },
            child: const Text("Logout")),
      ),
    );
  }
}
