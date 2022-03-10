// To parse this JSON data, do
//
//     final chatroom = chatroomFromJson(jsonString);

import 'dart:convert';

List<Chatroom> chatroomFromJson(String str) => List<Chatroom>.from(json.decode(str).map((x) => Chatroom.fromJson(x)));

String chatroomToJson(List<Chatroom> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chatroom {
    Chatroom({
        this.chatRoomId,
        this.senderEmail,
        this.receiverEmail,
        this.unreadMessages,
        this.username,
        this.phoneNo,
        this.imgStatus,
    });

    String? chatRoomId;
    String? senderEmail;
    String? receiverEmail;
    String? unreadMessages;
    String? username;
    String? phoneNo;
    String? imgStatus;

    factory Chatroom.fromJson(Map<String, dynamic> json) => Chatroom(
        chatRoomId: json["chatRoomId"],
        senderEmail: json["senderEmail"],
        receiverEmail: json["receiverEmail"],
        unreadMessages: json["unread_messages"],
        username: json["username"],
        phoneNo: json["phone_no"],
        imgStatus: json["img_status"],
    );

    Map<String, dynamic> toJson() => {
        "chatRoomId": chatRoomId,
        "senderEmail": senderEmail,
        "receiverEmail": receiverEmail,
        "unread_messages": unreadMessages,
        "username": username,
        "phone_no": phoneNo,
        "img_status": imgStatus,
    };
}

class ChatRoomModel{

  late String? username;
  late String? img;
  late String? chat;
  late String? time;
  late bool? mute;

  ChatRoomModel({
    
    this.username,
    this.img,
    this.chat,
    this.time,
    this.mute,
    
  });
}
