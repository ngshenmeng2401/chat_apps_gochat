import 'package:chat_apps_gochat/pages/chatroom/chat_room_tile.dart';
import 'package:chat_apps_gochat/pages/chatroom/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsView extends StatelessWidget {

  final chatController = Get.put(ChatsController());

  ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("GoChat".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => 
              LimitedBox(
                child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chatController.chatroomList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatRoomTile(index, chatController.chatroomList[index]);
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}