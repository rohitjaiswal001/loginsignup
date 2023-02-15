import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:login/main.dart';
import 'package:login/util/colors.dart';

import 'dart:html';

import 'package:login/view/home/homepage.dart';

class ReminderSet extends StatefulWidget {
  ReminderSet({super.key});

  @override
  State<ReminderSet> createState() => _ReminderSetState();
}

class _ReminderSetState extends State<ReminderSet> {
  var colcall = Colors.white;
  var setCol;

  bool colValue = false;
  int colIndex = 0;

  DateTime _dateOfDay = DateTime.now();
  //_showDate() {
  //DateTime? newDate =
  // showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100));
  //}

  ///
  ///
  ///
  ///
//

  //Color addcolor = Colors.white;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  void _showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colcall.withOpacity(0.2),
        width: Get.width,
        height: Get.height,

        // color: addcolor,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.black.withOpacity(0.002),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1.0),
                ),
                hintText: 'Titile ',
                labelText: 'Title',
              )),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade400, width: 1.0),
                  ),
                  hintText: 'Message ',
                  hintStyle: const TextStyle(
                    fontSize: 20.0,
                  ),
                  labelText: 'Message',
                ),
                keyboardType: TextInputType.multiline,
                minLines: 5, // <-- SEE HERE
                maxLines: 50,
              ),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
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
                              colcall = ColArr().colorArray[index];
                              setCol = ColArr().colorArray[2];
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
                              height: 60,
                              width: 60,

                              // padding: EdgeInsets.only(left: 90),
                              decoration: BoxDecoration(
                                  color: colcall,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Visibility(
                                visible: colIndex == index ? true : false,
                                //colValue ? true : false,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 90,
                                  width: 90,

                                  // padding: EdgeInsets.only(left: 90),
                                  decoration: BoxDecoration(
                                      color: colcall,
                                      borderRadius: BorderRadius.circular(100),
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
            GestureDetector(
              onTap: _showTime,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                alignment: Alignment.center,
                height: Get.height / 10,
                width: Get.width / 2,
                child: Text(
                  _timeOfDay
                      .format(context)
                      .toString(), //calling variable for time
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            Container(
              alignment: Alignment.center,
              height: Get.height / 10,
              width: Get.width / 2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              //color: colcall,
              child: GestureDetector(
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));

                  if (newDate == null) return;

                  // if "ok "=> new date
                  setState(() => _dateOfDay = newDate);
                },
                child: Text(
                  ("${_dateOfDay.year}-${_dateOfDay.month}-${_dateOfDay.day} ")
                      .toString(),
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: colcall.withOpacity(0.4), elevation: 1),
                  onPressed: () {
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
    );
  }
}
