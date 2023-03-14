import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:login/view/Auth/signup.dart';
import 'package:login/view/home/homepage.dart';

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
  final mobileController = TextEditingController();
  final otpController = TextEditingController();
  String verificationReceived = "";

  FirebaseAuth auth = FirebaseAuth.instance;

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

    bool textlocker = true;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        //FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(""),
        ),
        backgroundColor: Colors.white,

        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: height / 5),
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
                                    // focusNode: FocusNode(),
                                    enabled: textlocker,
                                    keyboardType: TextInputType.phone,
                                    controller: mobileController,
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
                                      prefixText: '+91  ',
                                      // prefixIcon: const Icon(
                                      //   Icons.phone,
                                      //   color: Colors.black,
                                      // ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                Visibility(
                                  visible: otpvisibile,
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    controller: otpController,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: mobilevisible,
                                  child: SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        verifyNumber();
                                        setState(() {
                                          textlocker = !textlocker;
                                          otpvisibile = !otpvisibile;
                                          mobilevisible = !mobilevisible;
                                          //
                                          //    mobilevisible = false;
                                        });
                                        log("          otp visible      ${otpvisibile}");
                                        ;
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
                                      child: Text("Submit"),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !mobilevisible & otpvisibile,
                                  child: SizedBox(
                                    height: 40,
                                    width: 120,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          verifyCode();
                                          setState(() {
                                            mobilevisible = !mobilevisible;
                                            otpvisibile = !otpvisibile;
                                          });
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color.fromARGB(
                                                      255, 232, 232, 230)),
                                        ),
                                        child: Text("Login")),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
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
        ),

        //
      ),
    );
  }

  void verifyNumber() {
    var country_code = '+91';
    // auth.setSettings(appVerificationDisabledForTesting: true);
    auth.verifyPhoneNumber(
        phoneNumber: country_code + mobileController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth
              .signInWithCredential(credential)
              .then((value) => print("You are logged in successfuly"));
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationReceived = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationReceived, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) => Get.to(HomePage()),
          // print("logged in ")
        );
  }
}
