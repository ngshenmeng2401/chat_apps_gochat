import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/pages/chats/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomTile extends StatelessWidget {

  final chatController = Get.put(ChatsController());
  final ChatRoomModel chatsRoomModel;
  final int index;
  ChatRoomTile(this.index, this.chatsRoomModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: (){
            chatController.navigateChatRecordView(chatsRoomModel);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: screenHeight/13,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Image.asset("${chatController.chatRoomModel[index].img}",
                      height: screenHeight/2,
                      width: screenWidth/1.3,
                      fit: BoxFit.fitWidth,),
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
                        Text("${chatController.chatRoomModel[index].username}",
                          style: const TextStyle(
                            fontSize: 18
                          ),),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("${chatController.chatRoomModel[index].chat}",
                          style: const TextStyle(
                            fontSize: 14
                          ),),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${chatController.chatRoomModel[index].time}"),
                      Icon(chatController.chatRoomModel[index].mute == true 
                        ? Icons.volume_mute
                        : null )
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