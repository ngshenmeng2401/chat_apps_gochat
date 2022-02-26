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
    });

    String? friendEmail;
    String? email;
    String? requestMessage;

    factory FriendRequest.fromJson(Map<String, dynamic> json) => FriendRequest(
        friendEmail: json["friend_email"],
        email: json["email"],
        requestMessage: json["request_message"],
    );

    Map<String, dynamic> toJson() => {
        "friend_email": friendEmail,
        "email": email,
        "request_message": requestMessage,
    };
}

class RequestModal{

  late String? friendEmail;
  late String? email;
  late String? requestMessage;

  RequestModal({
    this.friendEmail,
    this.email,
    this.requestMessage,
  });
}
