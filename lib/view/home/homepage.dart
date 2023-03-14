import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:login/view/auth/loginpage.dart';
import 'package:login/view/home/remindersetting.dart';

import 'package:login/model/cardmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/detail.dart';
import '../../helper/storage_helper.dart';

import '../../util/colors.dart';
import '../../util/email_pass_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('carddetails').snapshots();

  var doc_ref =
      FirebaseFirestore.instance.collection("carddetails").doc().get();

  final _movingController = Get.put(MoveDetails());
  Color color = Colors.white;
  int colorIndex = 0;
  var id;
  Stream collectionStream = FirebaseFirestore.instance
      .collection('carddetails')
      .snapshots(includeMetadataChanges: true);

  carddelete(id) async {
    await FirebaseFirestore.instance.collection('carddetails').doc(id).delete();
  }

  // Stream documentStream = FirebaseFirestore.instance
  //     .collection('carddetails')
  //     .doc('ABC123')
  //     .snapshots(includeMetadataChanges: true);
  @override
  void initState() {
    cardcolor();
//fetchDataBaseList(){dynamic resultant =await DataBa}
    super.initState();
  }

  cardcolor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      colorIndex = prefs.getInt('color')!;
    });
  }

  // List<cardModel> _firedata = [];

  final CollectionReference reminderList =
      FirebaseFirestore.instance.collection('carddetails');

  @override
  Widget build(BuildContext context) {
    //
    //final user = FirebaseAuth.instance.currentUser!;    // gets current user dertail

    //color = _movingController.cardbackgroundcolor.read('colorname');
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                log('ppppppppppppppppppppppppp$doc_ref');
                log("    count    ${MoveDetails().countbox.read('count')}");
                MoveDetails().countbox.erase();
                Get.to(ReminderSet());
                // do something
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: Get.width,
                height: Get.height,
                alignment: Alignment.center,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }
                    if (snapshot.connectionState == ConnectionState.done) {
                      log('gffgffghfghfghgghfhf${snapshot.data}');
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;

                        log('hhhhhhhhhhh${document.id.toString()}');

                        return Card(
                            elevation: 1,
                            child: ListTile(
                              title: Text(
                                data['title'],
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(data['message']),
                              leading:
                                  Icon(Icons.event_note, color: Colors.grey),
                              // trailing: IconButton(
                              //     onPressed: carddelete(
                              //         snapshot.data!.docs),
                              //     icon: Icon(Icons.close,
                              //         color: Colors.black))
                            ));
                      }).toList(),
                    );
                  },
                )

                // Card(
                //   color: ColArr().colorArray[colorIndex],
                //   //  _movingController.cardbackgroundcolor
                //   //     .read('colorname'),
                //   elevation: 1,

                //   child: Text("${_firedata.toString()}\n        }"),
                //   // child: Text(
                //   //     "${_movingController.movingController.text.toString()}  \n  ${_movingController.messageController.text.toString()}"),
                // );

                ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                log("color==============>${_movingController.cardbackgroundcolor.read('colorname')}");
                // StorageHelper.readData("email");
                log("=================count =========================count${MoveDetails().countbox.read('count')}");
                // log('=================Read=============> [Clicked] ${StorageHelper.readData("email")}');
                // StorageHelper.eraseData();

                // emailController.clear();
                // log('=================erase=============> [Clicked]${StorageHelper.readData("email")}');
                Get.offAll(LoginPage());
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );

//

//
  }

  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection("carddetails").get();
  //   // Get data from docs and convert map to List
  //   var allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  //   print("fffffffffffffff   ============       >$allData");

  //   setState(() {
  //    _firedata = List.from(allData);

  //   });
  // }

  // Future<void> getData() async {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection("carddetails").get();
  //   for (int i = 0; i < querySnapshot.docs.length; i++) {
  //     // var a = querySnapshot.docs[i];
  //     var a = querySnapshot.docs.map((doc) => doc.data()).toList();
  //     print(a);
  //     setState(() {
  //       _firedata = a
  //           .map((entry) => cardModel(
  //               color: "", date: "", message:entry["message"] ,time: "", title: ""))
  //           .toList();

  //       log("g                 gggggggggggggggggggggg             ======>>>>>>>>>>> ${_firedata['title']}");
  //     });
  //   }
  // }

  // Future getfiredataList() async {
  //   final uid = AuthService().currentUser?.uid;
  //   void data = await FirebaseFirestore.instance
  //       .collection('carddetails')
  //       .doc(uid)
  //       .collection('carddetails')
  //       .get();

  //       setState(() {

  //         _firedata = List.from(data.docs.)
  //       });
  // }
}
