import 'dart:io';
import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/pages/contacts/chat/chat_record_tile.dart';
import 'package:chat_apps_gochat/pages/contacts/chat/contact_chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactChatRecordView extends StatelessWidget {

  final contactsChatController = Get.put(ContactsChatController());
  final Friend friend;
  ContactChatRecordView(this.friend, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(friend.username!),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.more_horiz),
          )
        ]
      ),
      body: WillPopScope(
        onWillPop: (){
          if(contactsChatController.showEmoji.isTrue){
            contactsChatController.showEmoji.value == false;
          }else{
            Navigator.of(context).pop();
          }
          return Future.value(false);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              LimitedBox(
                child: 
                Obx(() {
                  return ListView.builder(
                    reverse: true,
                    primary: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contactsChatController.chatList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContactChatRecordTile(index,contactsChatController.chatList[index]);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: screenHeight/18,
        color: Colors.blue[100],
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: 35,
                color: Colors.grey[200],
                child: Center(
                  child: TextField(
                    focusNode: contactsChatController.focusNode,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(
                      fontSize: 16
                    ),
                    enableInteractiveSelection: true,
                    onChanged: (value) => contactsChatController.checkTextField(),
                    keyboardType: TextInputType.emailAddress,
                    controller: contactsChatController.messageController,
                    decoration: InputDecoration.collapsed(
                      hintText: "Type your message here".tr,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),),
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
                onPressed: contactsChatController.isTyping.value == true
                  ? () {
                    contactsChatController.sendMessage(friend.friendEmail!);
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