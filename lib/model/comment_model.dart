// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
    Comment({
        this.writerEmail,
        this.commentId,
        this.commentText,
        this.dateComment,
        this.postId,
        this.postOwnerEmail,
        this.content,
        this.username,
    });

    String? writerEmail;
    String? commentId;
    String? commentText;
    DateTime? dateComment;
    String? postId;
    String? postOwnerEmail;
    String? content;
    String? username;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        writerEmail: json["writerEmail"],
        commentId: json["comment_id"],
        commentText: json["comment_text"],
        dateComment: DateTime.parse(json["date_comment"]),
        postId: json["post_id"],
        postOwnerEmail: json["postOwnerEmail"],
        content: json["content"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "writerEmail": writerEmail,
        "comment_id": commentId,
        "comment_text": commentText,
        "date_comment": dateComment!.toIso8601String(),
        "post_id": postId,
        "postOwnerEmail": postOwnerEmail,
        "content": content,
        "username": username,
    };
}


class CommentModel{

  int? commentId;
  int? postId;
  String? email;
  String? content;
  DateTime? dateTimeComment;

  CommentModel({
    this.commentId,
    this.postId,
    this.email,
    this.content,
    this.dateTimeComment,
  });
}