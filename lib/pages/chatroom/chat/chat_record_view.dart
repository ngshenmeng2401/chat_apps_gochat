import 'package:chat_apps_gochat/model/chatroom_model.dart';
import 'package:chat_apps_gochat/pages/chatroom/chat/chat_record_controller.dart';
import 'package:chat_apps_gochat/pages/chatroom/chat/chat_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRecordView extends StatelessWidget {

  final chatRecordController = Get.put(ChatRecordController());
  final Chatroom chatroom;
  ChatRecordView(this.chatroom, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(chatroom.username!),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_horiz),
          )
        ]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LimitedBox(
              child: 
              Obx(() {
                return ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chatRecordController.chatList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatRecordTile(index,chatRecordController.chatList[index]);
                  },
                );
              }),
            ),
            
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: screenHeight/18,
        color: Colors.blue[100],
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: 35,
                color: Colors.grey[200],
                child: Center(
                  child: TextField(
                    focusNode: chatRecordController.focusNode,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(
                      fontSize: 16
                    ),
                    enableInteractiveSelection: true,
                    onChanged: (value) => chatRecordController.checkTextField(),
                    keyboardType: TextInputType.emailAddress,
                    controller: chatRecordController.messageController,
                    decoration: InputDecoration.collapsed(
                      hintText: "Type your message here".tr,
                    ),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: IconButton(
            //     onPressed: (){
            //       chatController.focusNode.unfocus();
            //       chatController.showEmoji.toggle();
            //     },
            //     icon: const Icon(Icons.emoji_emotions),
            //   ),
            // ),
            Expanded(
              flex: 2,
              child: Obx(() => MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.amber,
                onPressed: chatRecordController.isTyping.value == true
                  ? () {
                    print("Send");
                  }
                  : null,
                child: const Text("Send"),
              ),)
            )
          ],
        ),
      ),
    );
  }
}