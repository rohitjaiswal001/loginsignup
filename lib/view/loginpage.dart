import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login/app_routes/page_routes.dart';
import 'package:login/controller/common_controller.dart';
import 'package:login/helper/storage_helper.dart';
import 'package:login/view/signup.dart';
import 'package:login/util/common_text_controller.dart';

import 'forgetpass.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _commonController = Get.put(CommonController());

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white, // status bar color
    ));

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  color: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 20,
                      ),
                      Image.asset("assets/image/logoicon.png",
                          fit: BoxFit.cover, height: height / 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height / 20,
                            ),
                            TextField(
                              controller: emailController,
                              //  focusNode: emailfocus,
                              onSubmitted: (value) {
                                // FocusScope.of(context)
                                //     .requestFocus(passkeyfocus);
                              },
                              //autofocus: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade400, width: 1.0),
                                ),
                                hintText: 'Enter your Email ',
                                labelText: 'Email ID',
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(
                              () => TextField(
                                obscureText: _commonController.isVisible.value,
                                //  focusNode: passkeyfocus,
                                //autofocus: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    // border: OutlineInputBorder(

                                    // ),

                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1.0),
                                    ),
                                    hintText: 'Enter your password',
                                    labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Obx(() => Icon(
                                              _commonController.isVisible.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.black,
                                            )),
                                        onPressed: () {
                                          _commonController.isVisible.value =
                                              !_commonController
                                                  .isVisible.value;
                                        })),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  //FocusManager.instance.primaryFocus ?.unfocus();
                                  //
                                  //
                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             For<Pass()));

                                  Get.to(ForgetPass());
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("Forget Password",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade700)),
                                )),
                            SizedBox(
                              height: height / 100,
                            ),
                            SizedBox(
                                height: 40,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //
                                    //

                                    ///Gurpreet
                                    ///
                                    StorageHelper.writeData("email",
                                        emailController.text.toString().trim());
                                    log("email===> ${StorageHelper.readData("email")},,,,    ${emailController.text.toString().trim()}");
                                    // FocusManager.instance.primaryFocus ?.unfocus();
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             HomePage()));
                                    _commonController.isVisible.value = true;
                                    emailController.clear();
                                    Get.offAllNamed(PageRoutes.home);
                                  },

                                  // style: ElevatedButton.styleFrom(
                                  //     backgroundColor:
                                  //         Color.fromRGBO(250, 250, 250, 0)),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 232, 232, 230)),
                                  ),
                                  child: Text("Login"),
                                )),
                            SizedBox(
                              height: height / 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have account",
                                    style: TextStyle(fontSize: 15)),
                                Center(
                                  child: TextButton(
                                      onPressed: () {
                                        Get.to(Signup());
                                      },
                                      child: Text("Signup",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade700))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
