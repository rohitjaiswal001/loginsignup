// To parse this JSON data, do
//
//     final loginReg = loginRegFromJson(jsonString);

import 'dart:convert';

LoginReg loginRegFromJson(String str) => LoginReg.fromJson(json.decode(str));

String loginRegToJson(LoginReg data) => json.encode(data.toJson());

class LoginReg {
    LoginReg({
        this.code,
        this.status,
        this.message,
        this.data,
    });

    String? code;
    String? status;
    String? message;
    Data? data;

    factory LoginReg.fromJson(Map<String, dynamic> json) => LoginReg(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.flag,
        this.token,
    });

    String? id;
    String? flag;
    String? token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        flag: json["flag"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "flag": flag,
        "token": token,
    };
}
