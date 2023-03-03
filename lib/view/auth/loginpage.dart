import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/view/Auth/forgetpass.dart';
import 'package:login/view/Auth/signup.dart';

import '../home/homepage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode emailfocus = FocusNode();

  FocusNode passkeyfocus = FocusNode();

  var size, height, width;

  bool isvisible = true;
  bool otpvisibile = false;
  bool mobilevisible = true;

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        //FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height / 8),
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 20,
                              ),
                              Visibility(
                                visible: mobilevisible,
                                child: TextField(
                                  focusNode: emailfocus,
                                  onSubmitted: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(passkeyfocus);
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
                                          color: Colors.grey.shade400,
                                          width: 1.0),
                                    ),
                                    hintText: 'Enter your Mobile no. ',
                                    labelText: 'Mobile no.',
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Visibility(
                                visible: otpvisibile,
                                child: TextField(
                                  obscureText: isvisible,
                                  focusNode: passkeyfocus,
                                  //autofocus: true,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      // border: OutlineInputBorder(

                                      // ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1.0),
                                      ),
                                      hintText: 'Enter your OTP',
                                      labelText: 'OTP',
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            isvisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              isvisible = !isvisible;

                                              log("=================fggfg==============>$isvisible");
                                            });
                                          })),
                                ),
                              ),
                              Visibility(
                                child: TextButton(
                                    onPressed: () {
                                      //FocusManager.instance.primaryFocus ?.unfocus();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgetPass()));
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text("Forget Password",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey.shade700)),
                                    )),
                              ),
                              SizedBox(
                                height: height / 100,
                              ),
                              SizedBox(
                                  height: 40,
                                  width: 100,
                                  child: Visibility(
                                    visible: mobilevisible,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          otpvisibile = !otpvisibile;
                                          mobilevisible = !mobilevisible;
                                          //
                                          //    mobilevisible = false;
                                        });
                                        log("          otp visible      ${otpvisibile}");
                                        // FocusManager.instance.primaryFocus ?.unfocus();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             HomePage()));
                                      },

                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor:
                                      //         Color.fromRGBO(250, 250, 250, 0)),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 232, 232, 230)),
                                      ),
                                      child: Text("OTP"),
                                    ),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      mobilevisible = !mobilevisible;
                                      otpvisibile = !otpvisibile;
                                    });
                                  },
                                  child: Text("Login")),
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
                                          //FocusManager.instance.primaryFocus ?.unfocus();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Signup()));
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

        //
      ),
    );
  }
}
