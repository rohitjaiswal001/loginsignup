import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/util/colors.dart';

import 'package:login/view/home/homepage.dart';

class ReminderSet extends StatefulWidget {
  ReminderSet({super.key});

  @override
  State<ReminderSet> createState() => _ReminderSetState();
}

class _ReminderSetState extends State<ReminderSet> {
  var colcall = Colors.white;

  bool colValue = false;
  int colIndex = 0;

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

  //Color addcolor = Colors.white;
  TimeOfDay _timeOfDay = TimeOfDay.now();

  void _showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
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
      body: Container(
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
                      prefixIcon: Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(" Date"),
                          Text(
                            ("${getMonth}${dateOfDay.day}, ${dateOfDay.year} ")
                                .toString(),
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
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
                                colcall = ColArr().colorArray[index];

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
      ),
    );
  }
}
