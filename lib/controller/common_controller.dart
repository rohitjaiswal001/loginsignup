import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CommonController extends GetxController {
  RxBool isVisible = true.obs;

  RxBool isEnabled = false.obs;

  RxBool cisvisible = true.obs;

  FocusNode? remailfocus, passkeyfocus, cpasskeyfocus;

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


