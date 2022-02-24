import 'package:chat_apps_gochat/model/post_model.dart';
import 'package:chat_apps_gochat/pages/me/my_post/my_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PostTile extends StatelessWidget {

  final myPostController = Get.put(MyPostController());
  final Post postModel;
  final int index;
  PostTile(this.index, this.postModel);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String dateYearPosted = DateFormat('yyyy').format(myPostController.postList[index].datePost!);
    String dateMonthPosted = DateFormat('MMM').format(myPostController.postList[index].datePost!);
    String dateDayPosted = DateFormat('dd').format(myPostController.postList[index].datePost!);

    return Column(
      children: [
        InkWell(
          onTap: (() {
            myPostController.navigatePostDetails(postModel);
          }),
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            height: myPostController.postList[index].imgStatus == "noimage"
              ? screenHeight/12
              : screenHeight/8,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dateYearPosted,
                      style: const TextStyle(
                        fontSize: 18
                      ),),
                      const SizedBox( height:10),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children:  <TextSpan>[
                            TextSpan(text: dateDayPosted + " ", style: const TextStyle(fontSize: 20)),
                            TextSpan(text: dateMonthPosted,),
                          ],
                        ),
                      )
                    ]
                  )
                ),
                Expanded(
                  flex: myPostController.postList[index].imgStatus == "noimage"
                    ? 0
                    : 3,
                  child: Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: myPostController.postList[index].imgStatus == "noimage"
                      ? null
                      : Image.network("https://javathree99.com/s271059/gochat/images/post/${myPostController.postList[index].postId}.png",
                      height: screenHeight/2,
                      width: screenWidth/1.3,
                      fit: BoxFit.fitWidth,),
                  )
                ),
                Expanded(
                  flex: myPostController.postList[index].imgStatus == "noimage"
                    ? 8
                    : 5,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${myPostController.postList[index].content}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                          style: const TextStyle(
                            fontSize: 16
                          ),),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}