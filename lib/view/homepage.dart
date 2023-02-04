import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/common_controller.dart';
import 'package:login/view/loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 232, 232, 230)),
            ),
            onPressed: () {
              var reading = LoginPage().storage.read("email");
              log('bbbbbbbbbbbbbbbbbbbbbbb$reading');

            LoginPage().storage.remove('email');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Logout")),
      ),
    );
  }
}
