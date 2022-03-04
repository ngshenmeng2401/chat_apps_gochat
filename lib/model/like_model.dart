// To parse this JSON data, do
//
//     final like = likeFromJson(jsonString);

import 'dart:convert';

List<Like> likeFromJson(String str) => List<Like>.from(json.decode(str).map((x) => Like.fromJson(x)));

String likeToJson(List<Like> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Like {
    Like({
        this.writerEmail,
        this.likeId,
        this.likeStatus,
        this.postId,
        this.postOwnerEmail,
        this.content,
        this.username,
        this.phoneNo,
    });

    String? writerEmail;
    String? likeId;
    String? likeStatus;
    String? postId;
    String? postOwnerEmail;
    String? content;
    String? username;
    String? phoneNo;

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        writerEmail: json["writerEmail"],
        likeId: json["like_id"],
        likeStatus: json["like_status"],
        postId: json["post_id"],
        postOwnerEmail: json["postOwnerEmail"],
        content: json["content"],
        username: json["username"],
        phoneNo: json["phone_no"],
    );

    Map<String, dynamic> toJson() => {
        "writerEmail": writerEmail,
        "like_id": likeId,
        "like_status": likeStatus,
        "post_id": postId,
        "postOwnerEmail": postOwnerEmail,
        "content": content,
        "username": username,
        "phone_no": phoneNo,
    };
}



class LikeModel{

  late String? likeId;
  late String? username;
  late String? postId;

  LikeModel({
    this.likeId,
    this.username,
    this.postId,
  });
}