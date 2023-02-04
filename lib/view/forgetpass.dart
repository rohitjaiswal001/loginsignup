import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/controller/common_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:login/view/loginpage.dart';

class ForgetPass extends StatelessWidget {
  ForgetPass({super.key});
  final _commonController = Get.put(CommonController());
  @override
  FocusNode remailfocus = FocusNode();

  FocusNode passkeyfocus = FocusNode();
  FocusNode cpasskeyfocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white, // status bar color
    ));
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          // height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                    color: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 20,
                          ),
                          Image.asset("assets/image/logoicon.png",
                              fit: BoxFit.cover, height: height / 6),
                          SizedBox(
                            height: height / 50,
                          ),
                          Obx(
                            () => Visibility(
                              visible: !_commonController.isEnabled.value,
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1.0),
                                      ),
                                      hintText: 'Enter your Email ',
                                      labelText: 'Email ID',
                                      // prefixIcon: Icon(
                                      //   Icons.person,
                                      //   color: Colors.black,
                                      // ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 20,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 232, 232, 230)),
                                      ),
                                      onPressed: () {
                                        _commonController.isEnabled.value =
                                            !_commonController.isEnabled.value;
                                        log('========>${_commonController.isVisible.value}');
                                        log('===enablr=====>${_commonController.isEnabled.value}');
                                      },

                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => LoginPage()));

                                      child: Text(" Submit")),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //
                          //
                          //
                          //
                          //
                          //

                          Obx(
                            () => Visibility(
                              visible: _commonController.isEnabled.value,
                              child: WillPopScope(
                                onWillPop: () async => _commonController
                                    .isEnabled
                                    .value = !_commonController.isEnabled.value,
                                child: Container(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        obscureText:
                                            _commonController.isVisible.value,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade400,
                                                  width: 1.0),
                                            ),
                                            hintText: 'New Password ',
                                            labelText: 'New Password',
                                            suffixIcon: IconButton(
                                                icon: Obx(() => Icon(
                                                      _commonController
                                                              .isVisible.value
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off,
                                                      color: Colors.black,
                                                    )),
                                                onPressed: () {
                                                  _commonController
                                                          .isVisible.value =
                                                      !_commonController
                                                          .isVisible.value;
                                                })),
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      TextFormField(
                                        obscureText:
                                            _commonController.cisvisible.value,
                                        focusNode: passkeyfocus,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(cpasskeyfocus);
                                        },
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade400,
                                                  width: 1.0),
                                            ),
                                            hintText: 'Confirm Password ',
                                            labelText: 'Confirm Password',
                                            suffixIcon: IconButton(
                                                icon: Icon(
                                                  _commonController
                                                          .cisvisible.value
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  // Icons.remove_red_eye,
                                                  color: Colors.black,
                                                ),
                                                onPressed: () {
                                                  _commonController
                                                          .cisvisible.value =
                                                      !_commonController
                                                          .cisvisible.value;
                                                })
                                            // prefixIcon: Icon(
                                            //   Icons.person,
                                            //   color: Colors.black,
                                            // ),
                                            ),
                                      ),
                                      SizedBox(
                                        height: height / 20,
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 232, 232, 230)),
                                          ),
                                          onPressed: () {
                                            _commonController.isEnabled.value =
                                                !_commonController
                                                    .isEnabled.value;
                                            log('submit 2 nnnnnnnnnnnnnnnnnnnnnnnnnnn{${_commonController.isEnabled.value}');
                                            Get.toNamed('login');
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (con                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             text) =>
                                            //             LoginPage()));
                                          },
                                          child: Text("Submit"))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
