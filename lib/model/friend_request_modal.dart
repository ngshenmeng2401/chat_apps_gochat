// To parse this JSON data, do
//
//     final friendRequest = friendRequestFromJson(jsonString);

import 'dart:convert';

List<FriendRequest> friendRequestFromJson(String str) => List<FriendRequest>.from(json.decode(str).map((x) => FriendRequest.fromJson(x)));

String friendRequestToJson(List<FriendRequest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FriendRequest {
    FriendRequest({
        this.friendEmail,
        this.email,
        this.requestMessage,
        this.username,
        this.phoneNo,
        this.imgStatus,
    });

    String? friendEmail;
    String? email;
    String? requestMessage;
    String? username;
    String? phoneNo;
    String? imgStatus;

    factory FriendRequest.fromJson(Map<String, dynamic> json) => FriendRequest(
        friendEmail: json["friend_email"],
        email: json["email"],
        requestMessage: json["request_message"],
        username: json["username"],
        phoneNo: json["phone_no"],
        imgStatus: json["img_status"],
    );

    Map<String, dynamic> toJson() => {
        "friend_email": friendEmail,
        "email": email,
        "request_message": requestMessage,
        "username": username,
        "phone_no": phoneNo,
        "img_status": imgStatus,
    };
}
