// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        this.postId,
        this.content,
        this.imgStatus,
        this.datePost,
    });

    String? postId;
    String? content;
    String? imgStatus;
    DateTime? datePost;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
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
