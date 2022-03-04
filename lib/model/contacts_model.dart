// To parse this JSON data, do
//
//     final contacts = contactsFromJson(jsonString);

import 'dart:convert';

List<Contacts> contactsFromJson(String str) => List<Contacts>.from(json.decode(str).map((x) => Contacts.fromJson(x)));

String contactsToJson(List<Contacts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contacts {
    Contacts({
        this.email,
        this.username,
        this.phoneNo,
        this.imgStatus,
        this.action,
    });

    String? email;
    String? username;
    String? phoneNo;
    String? imgStatus;
    String? action;

    factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        email: json["email"],
        username: json["username"],
        phoneNo: json["phone_no"],
        imgStatus: json["img_status"],
        action: json["action"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "phone_no": phoneNo,
        "img_status": imgStatus,
        "action": action,
    };
}
