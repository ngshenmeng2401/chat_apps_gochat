import 'package:chat_apps_gochat/model/like_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LikeTile extends StatelessWidget {

  final momentsController = Get.put(MomentsController());
  final Like like;
  final int index;
  final String postId;
  LikeTile(this.index, this.postId, this.like, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
      child: 
      postId == like.postId 
      ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: 
              like.profileImg == "noimage"
              ? 
              Image.asset("assets/images/p1.png",
                height: screenHeight/20,
                fit: BoxFit.contain,)
              : Image.network("https://hubbuddies.com/271059/gochat/images/user_profile/${like.phoneNo}.png",
                height: screenHeight/20,),
            ),
            const SizedBox(width: 20),
            Text(like.username!,
              overflow: TextOverflow.ellipsis,),
          ],
        )
      : Container()
    );
  }
}