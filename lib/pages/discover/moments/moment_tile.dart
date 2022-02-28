import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MomentTile extends StatelessWidget {
  
  final momentsController = Get.put(MomentsController());
  final MomentModal momentModal;
  MomentTile(this.momentModal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                    child: //  friend.imgStatus == "noimage"
                    // ?  
                    Image.asset("assets/images/p1.png",
                    fit: BoxFit.fitWidth,)
                    // : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${friend.phoneNo}.png")
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
                      Text(momentModal.email!,
                        style: const TextStyle(
                          fontSize: 16
                        ),),
                      const SizedBox(height: 10),
                      Text(momentModal.content!,
                        style: const TextStyle(
                          fontSize: 18
                        ),),
                      const SizedBox(height: 10),
                      Image.asset("assets/images/p1.png",
                        fit: BoxFit.fitWidth,),
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
                      )
                    ],
                  ),
                )
              ),
            ],
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