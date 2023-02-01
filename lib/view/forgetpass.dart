import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:login/view/loginpage.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  bool isvisible = true;
  bool cisvisible = true;
  FocusNode remailfocus = FocusNode();

  FocusNode passkeyfocus = FocusNode();
  FocusNode cpasskeyfocus = FocusNode();
  var isEnabled = true;
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
                          Visibility(
                            visible: isEnabled,
                            child: Column(
                              children: [
                                TextField(
                                  //focusNode: emailfocus,
                                  // onSubmitted: (value) {
                                  //  FocusScope.of(context)
                                  //  .requestFocus(passkeyfocus);
                                  // },

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
                                    onPressed: isEnabled
                                        ? () {
                                            setState(() {
                                              isEnabled = !isEnabled;

                                              log("===========$isEnabled");
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) => ForgetPass()));
                                            });
                                          }
                                        : null,
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) => LoginPage()));

                                    child: Text(" Submit")),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: !isEnabled,
                            child: Container(
                              child: Column(
                                children: [
                                  TextFormField(
                                    obscureText: isvisible,
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
                                        hintText: 'New Password ',
                                        labelText: 'New Password',
                                        // prefixIcon: Icon(
                                        //   Icons.person,
                                        //   color: Colors.black,
                                        // ),

                                        suffixIcon: IconButton(
                                            icon: Icon(
                                              isvisible
                                                  ? Icons.visibility
                                                  // ignore: dead_code
                                                  : Icons.visibility_off,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                isvisible = !isvisible;

                                                log("===============================>$isvisible");
                                              });
                                            })),
                                  ),
                                  SizedBox(
                                    height: height / 40,
                                  ),
                                  TextFormField(
                                    obscureText: cisvisible,
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
                                              color: Colors.black, width: 1.0),
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
                                              cisvisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              // Icons.remove_red_eye,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                cisvisible = !cisvisible;

                                                log("===============================>$isvisible");
                                              });
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: Text("Submit"))
                                ],
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
