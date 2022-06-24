import 'package:chat_apps_gochat/model/my_post_model.dart';
import 'package:chat_apps_gochat/pages/me/my_post/my_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyPostDetailsView extends StatelessWidget {

  final MyPost postModel;
  final myPostController = Get.put(MyPostController());
  MyPostDetailsView(this.postModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String dateYearPosted = DateFormat('dd MMM yyyy HH:mm').format(postModel.datePost!);

    return Scaffold(
      appBar: AppBar(
        title: Text(dateYearPosted),
        actions: [
          IconButton(
            onPressed: (){
              myPostController.deletePostDialog(postModel.postId!, postModel.imgStatus!);
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: postModel.imgStatus == "noimage"
                ? Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: Text(postModel.content!,
                      textAlign: TextAlign.left,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,),),
                  )
                : Container(
                    color: Colors.black,
                    child: Stack(
                      children: [
                        Container(
                          height: screenHeight,
                          width: screenWidth,
                          child: Image.network("https://hubbuddies.com/271059/gochat/images/post/${postModel.postId}.png",
                          fit: BoxFit.contain,),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: screenHeight/6,
                            color: Colors.black26,
                            child: Text(postModel.content!,
                              textAlign: TextAlign.left,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white),),
                          ),
                        ),
                      ],
                    ),
                  )
            ),
          ],
        ),
      ),
    );
  }
}