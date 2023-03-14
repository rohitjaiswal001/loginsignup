import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:login/util/colors.dart';

import 'package:login/view/home/homepage.dart';

import 'package:login/controller/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderSet extends StatefulWidget {
  ReminderSet({super.key});

  @override
  State<ReminderSet> createState() => _ReminderSetState();
}

class _ReminderSetState extends State<ReminderSet> {
  

 
  CollectionReference carddetails =
      FirebaseFirestore.instance.collection('carddetails');
  var colcall = Colors.white;
  int colorIndex = 0;

  bool colValue = false;
  int colIndex = 0;
  var colcode;

  String timestore = "12:00 AM";

  String dateStore = 'mmddyy';

  DateTime dateOfDay = DateTime.now();
  // var m = dateOfDay.month;
  List<String> monthname = [
    "January",
    " Feburary ",
    "March ",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "Noember",
    "December"
  ];
  int count = 0;
  void _incrementCounter() {
    setState(() {
      count++;
      MoveDetails().countbox.write('count', MoveDetails().count.toString());
    });
  }

  var index;
  Color timeContainerColor = Colors.grey;
  var getMonth;

  @override
  void initState() {
    super.initState();

    getMonth = monthname[dateOfDay.month - 1];
  }

  DateTime? newDate;
  getDAte() async {
    newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    setState(() {
      dateOfDay = newDate!;


      getMonth = monthname[dateOfDay.month - 1];
    });
  }

  int i = 0;

  final _movingController = Get.put(MoveDetails());

  // final colcall= Get.put(variab)
  //Color addcolor = Colors.white;
  TimeOfDay _timeOfDay = TimeOfDay.now();

  void _showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
        timestore = _timeOfDay.format(context).toString();

        log("fgfsgd==============timestring===============$timestore");
        timeContainerColor = Colors.grey;
        if (_timeOfDay == null) return;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        // shadowColor: null,
        backgroundColor: Colors.white10,
        title: Text("  "),
      ),
      body:
      
      
       Container(
        color: colcall.withOpacity(0.1),
        width: Get.width,
        height: Get.height,

        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.black.withOpacity(0.002),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: TextFormField(
                    controller: _movingController.movingController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Titile ',
                      labelText: 'Title',
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  getDAte();
                  if (newDate == null) return;

                  // if "ok "=> new date
                  setState(() {
                    dateOfDay = newDate!;
                    getMonth = monthname[dateOfDay.month - 1];
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  width: Get.width,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        //   borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(child: Text(" Date")),
                              Container(
                                child: Text(
                                  ("${getMonth}${dateOfDay.day}, ${dateOfDay.year} ")
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
//BoxDecoration(border: Border.all(color: colcall));
                    timeContainerColor = Colors.blue;
                  });
                  _showTime();
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    // height: Get.height / 10,
                    width: Get.width,
                    // color: timeContainerColor,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.access_time_outlined,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Time"),
                            Text(
                              _timeOfDay
                                  .format(context)
                                  .toString(), //calling variable for time
                              style: const TextStyle(fontSize: 15),
                            ),
                          ]),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _movingController.messageController,
                  style: const TextStyle(fontSize: 15),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: 'Message ',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                    labelText: 'Message',
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 50,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                // width: Get.width/20,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: ColArr().colorArray.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      colcall = ColArr().colorArray[index];
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                colcode = ColArr().colorcode[index];
                                colcall = Color(colcode);
                                colorIndex = index;
                                //_movingController.colorcontroller = colcode;
//
                                // colcall = ColArr().colorArray[index];

                                // _movingController.colorcontroller =
                                //     ColArr().colorArray[index];

                                // i = index;

                                colValue = !colValue;
                                colIndex = index;
                              });
                            },

                            // {
                            //   setState(() {
                            //     addcolor =
                            //         ColArr().colorArray[index].withOpacity(0.2);
                            //     debugPrint("color====> $addcolor");
                            //   });
                            // },
                            child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,

                                // padding: EdgeInsets.only(left: 90),
                                decoration: BoxDecoration(
                                    color: colcall,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Visibility(
                                  visible: colIndex == index ? true : false,
                                  //colValue ? true : false,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 60,

                                    // padding: EdgeInsets.only(left: 90),
                                    decoration: BoxDecoration(
                                        color: colcall,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color: Colors.white, width: 5)),
                                  ),
                                  // Icon(
                                  //   Icons.check_circle,
                                  //   color: Colors.black,
                                  //   size: 30.0,
                                  // ),
                                )),
                          ),
                          SizedBox(
                            width: Get.width / 20,
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // side: BorderSide(width: 0)

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        elevation: 1),
                    onPressed: () async {
                      await carddetails
                          .add({
                            'title': _movingController.movingController.text,
                            'message': _movingController.messageController.text,
                            'time': timestore
                          })
                          .then((value) => print("User Added"))
                          .catchError(
                              (error) => print("Failed to add user: $error"));

                      _incrementCounter;
                      MoveDetails().boxx.write(
                          'title',
                          MoveDetails()
                              .movingController
                              .text
                              .toString()
                              .trim());

                      MoveDetails().boxx.write(
                          'message',
                          MoveDetails()
                              .messageController
                              .text
                              .toString()
                              .trim());
                      MoveDetails().boxx.write('time', timestore.toString());

                      log("ggdgdgdgfgdfgd          ===========>   ${_movingController.movingController.text.toString()}  ");

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt('color', colorIndex);
                      print("===================>${colcall.value}");
                      // MoveDetails()
                      //     .cardbackgroundcolor
                      //     .write('colorname', MoveDetails().colorcontroller);
                      // log("ggdgdgdgfgdfgd      colorrrrrrr    ===========>   ${colcode}  ");

                      Get.to(HomePage());
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              )
            ]),
          ),
        ),
      ),
    );


  
  }
}
