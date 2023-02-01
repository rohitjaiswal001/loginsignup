import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/view/homepage.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isvisible = true;
  bool cisvisible = true;
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
                            height: height / 20,
                          ),
                          TextField(
                            focusNode: remailfocus,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(passkeyfocus);
                            },
                            //focusNode: emailfocus,
                            // onSubmitted: (value) {
                            //  FocusScope.of(context)
                            //  .requestFocus(passkeyfocus);
                            // },

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 1.0),
                              ),
                              hintText: 'Enter your Email ',
                              labelText: 'Email ID',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            focusNode: passkeyfocus,
                            onSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(cpasskeyfocus);
                            },
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
                                      color: Colors.grey.shade400, width: 1.0),
                                ),
                                hintText: "Enter Password ",
                                labelText: "Password",
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                  color: Colors.black,
                                ),
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
                                    })
                                    
                                    ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                              focusNode: cpasskeyfocus,
                              obscureText: cisvisible,
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
                                  hintText: "Confirm Password ",
                                  labelText: "Confirm Password",
                                  prefixIcon: Icon(
                                    Icons.password_outlined,
                                    color: Colors.black,
                                  ),
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
                                      )
                                      ),
                          SizedBox(
                            height: height / 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 232, 232, 230)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: Text("Register",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black))),
                          SizedBox(
                            height: 30,
                          )
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
