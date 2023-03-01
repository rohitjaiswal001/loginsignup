import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CommonController extends GetxController {
  RxBool isVisible = true.obs;

  RxBool isEnabled = false.obs;

  RxBool cisvisible = true.obs;

  FocusNode? remailfocus, passkeyfocus, cpasskeyfocus;

  var screenIndex;

  @override
  void onInit() {
    remailfocus = FocusNode();
    passkeyfocus = FocusNode();
    cpasskeyfocus = FocusNode();

    super.onInit();
  }

  @override
  void dispose() {
    remailfocus!.dispose();
    passkeyfocus!.dispose();
    cpasskeyfocus!.dispose();
    super.dispose();
  }



}
