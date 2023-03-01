import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MoveDetails extends GetxController {
  final boxx = GetStorage();
  final colorbox = GetStorage();
  final cardbackgroundcolor = GetStorage();
  final movingController = TextEditingController();
  final messageController = TextEditingController();
  Color? colorcontroller = Colors.white;
  late final int? count;
  final countbox = GetStorage();
}
