import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MomentTile extends StatelessWidget {
  
  final momentsController = Get.put(MomentsController());
  final Moment moment;
  MomentTile(this.moment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String datePosted = DateFormat('dd MMM yyyy HH:mm').format(moment.datePost!);

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
                flex: 8,
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
              Expanded(
                flex: 1,
                child: Container()
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
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(datePosted),
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
                          )
                        ],
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() => momentsController.isOption.value == true
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[350],
                  ),
                  width: screenWidth/2.5,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_border_outlined,
                              size: 20,),
                            Text(" Like"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
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
            const SizedBox(width: 10),
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
                  momentsController.displayLikeComment(momentsController.isOption.value);
                },
                icon: const Icon(Icons.more_horiz)
              ),
            ),
          ],
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