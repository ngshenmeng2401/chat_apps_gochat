import 'package:chat_apps_gochat/model/like_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LikeTile extends StatelessWidget {

  final momentsController = Get.put(MomentsController());
  final Like like;
  final int index;
  final String postId;
  LikeTile(this.index, this.like, this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: postId == like.postId 
      ? Row(
          children: [
            Text(index.toString()),
            // Text(like.username! + ","),
            const SizedBox(width:5),
          ],
        )
      : Container()
    );
  }
}