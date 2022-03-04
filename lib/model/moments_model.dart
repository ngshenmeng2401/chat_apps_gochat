// To parse this JSON data, do
//
//     final moment = momentFromJson(jsonString);

import 'dart:convert';

List<Moment> momentFromJson(String str) => List<Moment>.from(json.decode(str).map((x) => Moment.fromJson(x)));

String momentToJson(List<Moment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Moment {
    Moment({
        this.writerEmail,
        this.postId,
        this.content,
        this.momentImg,
        this.datePost,
        this.likes,
        this.username,
        this.phoneNo,
        this.profileImg,
        this.likeaction,
    });

    String? writerEmail;
    String? postId;
    String? content;
    String? momentImg;
    DateTime? datePost;
    String? likes;
    String? username;
    String? phoneNo;
    String? profileImg;
    String? likeaction;

    factory Moment.fromJson(Map<String, dynamic> json) => Moment(
        writerEmail: json["writerEmail"],
        postId: json["post_id"],
        content: json["content"],
        momentImg: json["moment_img"],
        datePost: DateTime.parse(json["date_post"]),
        likes: json["likes"],
        username: json["username"],
        phoneNo: json["phone_no"],
        profileImg: json["profile_img"],
        likeaction: json["likeaction"],
    );

    Map<String, dynamic> toJson() => {
        "writerEmail": writerEmail,
        "post_id": postId,
        "content": content,
        "moment_img": momentImg,
        "date_post": datePost!.toIso8601String(),
        "likes": likes,
        "username": username,
        "phone_no": phoneNo,
        "profile_img": profileImg,
        "likeaction": likeaction,
    };
}
