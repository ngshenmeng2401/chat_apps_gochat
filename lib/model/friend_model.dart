// To parse this JSON data, do
//
//     final friend = friendFromJson(jsonString);

import 'dart:convert';

List<Friend> friendFromJson(String str) => List<Friend>.from(json.decode(str).map((x) => Friend.fromJson(x)));

String friendToJson(List<Friend> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Friend {
    Friend({
        this.friendEmail,
        this.friendStatus,
        this.username,
        this.phoneNo,
        this.imgStatus,
    });

    String? friendEmail;
    String? friendStatus;
    String? username;
    String? phoneNo;
    String? imgStatus;

    factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        friendEmail: json["friend_email"],
        friendStatus: json["friend_status"],
        username: json["username"],
        phoneNo: json["phone_no"],
        imgStatus: json["img_status"],
    );

    Map<String, dynamic> toJson() => {
        "friend_email": friendEmail,
        "friend_status": friendStatus,
        "username": username,
        "phone_no": phoneNo,
        "img_status": imgStatus,
    };
}
