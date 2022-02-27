// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<MyPost> postFromJson(String str) => List<MyPost>.from(json.decode(str).map((x) => MyPost.fromJson(x)));

String postToJson(List<MyPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyPost {
    MyPost({
        this.postId,
        this.content,
        this.imgStatus,
        this.datePost,
    });

    String? postId;
    String? content;
    String? imgStatus;
    DateTime? datePost;

    factory MyPost.fromJson(Map<String, dynamic> json) => MyPost(
        postId: json["post_id"],
        content: json["content"],
        imgStatus: json["img_status"],
        datePost: DateTime.parse(json["date_post"]),
    );

    Map<String, dynamic> toJson() => {
        "post_id": postId,
        "content": content,
        "img_status": imgStatus,
        "date_post": datePost!.toIso8601String(),
    };
}