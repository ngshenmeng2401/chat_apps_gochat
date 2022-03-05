import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/comment_tile.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class MomentTile extends StatelessWidget {
  
  final momentsController = Get.put(MomentsController());
  final Moment moment;
  final int index;
  final bool comment;
  MomentTile(this.index, this.moment, this.comment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String datePosted = DateFormat('yyyy-MM-dd HH:mm:ss').format(moment.datePost!);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LimitedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: 
                     moment.profileImg == "noimage"
                    ? Image.asset("assets/images/p1.png",
                      fit: BoxFit.fitWidth,)
                    : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${moment.phoneNo}.png")
                  )
                  
                )
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(moment.username!,
                        style: const TextStyle(
                          fontSize: 16
                        ),),
                      const SizedBox(height: 10),
                      Text(moment.content!,
                        style: const TextStyle(
                          fontSize: 18
                        ),),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
        LimitedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                )
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 5, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      moment.momentImg == "noimage"
                      ? Container()
                      : Image.network("https://javathree99.com/s271059/gochat/images/post/${moment.postId}.png",
                        ),
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 4,
                child: Container()
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(),),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  children: [
                    Text(timeago.format(DateTime.parse(datePosted))),
                    const SizedBox(width: 10),
                    Obx(() => 
                    moment.phoneNo == momentsController.phoneNo.value
                      ? GestureDetector(
                          onTap: (){
                            momentsController.deletePost(moment.postId!, moment.momentImg!);
                          },
                          child: Text("Delete",
                            style: TextStyle(
                              color: Colors.blue[700],
                              decoration: TextDecoration.underline,
                            ),),
                        )
                      : Container()
                    ),
                  ],
                ),
              ),),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() => momentsController.optionList[index] == true
                    ? Container(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[350],
                        ),
                        width: screenWidth/2.8,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            moment.likeaction == "unlike"
                              ? GestureDetector(
                                  onTap: (){
                                    momentsController.toggleLikeButton("like", moment.postId!);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.favorite_border_outlined,
                                        size: 20,),
                                      Text(" Like"),
                                    ],
                                  ),
                                )
                              : GestureDetector(
                                  onTap: (){
                                    momentsController.toggleLikeButton("unlike", moment.postId!);
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.favorite_border_outlined,
                                        size: 20,),
                                      Text(" Cancel"),
                                    ],
                                  ),
                                ),
                            GestureDetector(
                              onTap: (){
                                momentsController.displayCommentBox(comment, index);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.mode_comment_outlined,
                                    size: 20,),
                                  Text(" Comment"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[300],
                    ),
                    width: screenWidth/12,
                    height: 25,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: (){
                        momentsController.displayLikeComment(momentsController.optionList[index], index);
                      },
                      icon: const Icon(Icons.more_horiz)
                    ),
                  ),
                ],
              ))
          ],
        ),
        const SizedBox(height: 5),
        LimitedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          momentsController.displayLikeList(screenHeight, screenWidth, moment.postId!);
                        },
                        child: Container(
                          color: Colors.grey[200],
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.favorite_outline,
                                size: 15,),
                              const SizedBox(width: 5,),
                              int.parse(moment.likes!) > 0
                              ? Text(moment.likes!)
                              : const Text(""),
                            ],
                          ),
                        ),
                      ),
                      LimitedBox(
                        child: Obx(() {
                          return ListView.builder(
                            primary: true,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: momentsController.commentList.length, 
                            itemBuilder: (BuildContext context, int index) {
                              return CommentTile(index, momentsController.commentList[index],moment.postId!);
                            },
                          );
                        }),
                      ),
                      
                      Obx(() {
                        if(momentsController.commentBoxList[index] == true){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  height: 30,
                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[300],
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      enableInteractiveSelection: true,
                                      style: const TextStyle(
                                        fontSize: 14
                                      ),
                                      onChanged: (value) {
                                        momentsController.checkTextField();
                                      },
                                      controller: momentsController.commentController,
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Comment".tr,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: const Icon(Icons.cancel_outlined),
                                  onPressed: (){
                                    momentsController.closeCommentBox(index);
                                  },
                                )
                              ),
                              Expanded(
                                flex: 2,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: 25,
                                  color: Colors.blueAccent,
                                  onPressed: momentsController.isTyping.value == true
                                  ? () {
                                    momentsController.sendCommentPost(moment.postId!,index);
                                  }
                                  : null,
                                  child: const Text("Send"),
                                ))
                            ],
                          );
                        }else{
                          return
                          const Padding(padding: EdgeInsets.all(0));
                        }
                      }
                    ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}