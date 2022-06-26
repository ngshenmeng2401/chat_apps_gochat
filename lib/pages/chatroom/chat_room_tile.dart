import 'package:badges/badges.dart';
import 'package:chat_apps_gochat/model/chatroom_model.dart';
import 'package:chat_apps_gochat/pages/chatroom/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomTile extends StatelessWidget {

  final chatController = Get.put(ChatsController());
  final Chatroom chatroom;
  final int index;
  ChatRoomTile(this.index, this.chatroom, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: (){
            chatController.navigateChatRecordView(chatroom);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: screenHeight/13,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Badge(
                    showBadge: chatroom.unreadMessages == "0" ? false : true,
                    badgeColor: Colors.red[400]!,
                    badgeContent: Text(chatroom.unreadMessages!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),),
                    position: BadgePosition.topEnd(
                      top: -10,
                      end: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: chatroom.imgStatus == "noimage"
                        ? Image.asset("assets/images/p1.png",
                            fit: BoxFit.contain,)
                        : Image.network("https://hubbuddies.com/271059/gochat/images/user_profile/${chatroom.phoneNo}.png",
                            fit: BoxFit.contain,)
                    ),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${chatroom.username}",
                          style: const TextStyle(
                            fontSize: 18
                          ),),
                        const SizedBox(
                          height: 5,
                        ),
                        // Text("${chatController.chatRoomModel[index].chat}",
                        //   style: const TextStyle(
                        //     fontSize: 14
                        //   ),),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      // Text("${chatController.chatRoomModel[index].time}"),
                      // Icon(chatController.chatRoomModel[index].mute == true 
                      //   ? Icons.volume_mute
                      //   : null )
                    ],
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