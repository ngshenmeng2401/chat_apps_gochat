import 'package:chat_apps_gochat/pages/chats/chat_room_tile.dart';
import 'package:chat_apps_gochat/pages/chats/chats_controller.dart';
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
            Container(
              height: screenHeight/1.1,
              child: ListView.builder(
                itemCount: chatController.chatRoomModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatRoomTile(index, chatController.chatRoomModel[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}