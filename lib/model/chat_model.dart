// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

List<Chat> chatFromJson(String str) => List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String chatToJson(List<Chat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chat {
    Chat({
        this.chatId,
        this.senderEmail,
        this.message,
        this.seen,
        this.dateSent,
        this.phoneNo,
    });

    String? chatId;
    String? senderEmail;
    String? message;
    String? seen;
    DateTime? dateSent;
    String? phoneNo;

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        chatId: json["chat_id"],
        senderEmail: json["senderEmail"],
        message: json["message"],
        seen: json["seen"],
        dateSent: DateTime.parse(json["date_sent"]),
        phoneNo: json["phone_no"],
    );

    Map<String, dynamic> toJson() => {
        "chat_id": chatId,
        "senderEmail": senderEmail,
        "message": message,
        "seen": seen,
        "date_sent": dateSent!.toIso8601String(),
        "phone_no": phoneNo,
    };
}

class ChatRecordModel{

  late String? username;
  late String? img;
  late String? imgStatus;
  late String? message;
  late String? time;

  ChatRecordModel({
    
    this.username,
    this.img,
    this.imgStatus,
    this.message,
    this.time,    
  });
}