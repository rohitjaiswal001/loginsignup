import 'package:flutter/cupertino.dart';

class cardModel {
  String? title;
  String? date;
  String? time;
  String? message;
  String? color;

  cardModel({this.title, this.date, this.time, this.message, this.color});

  cardModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    time = json['time'];
    message = json['message'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['time'] = this.time;
    data['message'] = this.message;
    data['color'] = this.color;
    return data;
  }
}
