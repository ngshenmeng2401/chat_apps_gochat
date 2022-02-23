// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.username,
        this.phoneNo,
        this.imgStatus,
    });

    String? username;
    String? phoneNo;
    String? imgStatus;

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        phoneNo: json["phone_no"],
        imgStatus: json["img_status"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "phone_no": phoneNo,
        "img_status": imgStatus,
    };
}
