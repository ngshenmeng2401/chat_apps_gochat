import 'dart:io';

import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/pages/chats/chat_record_tile.dart';
import 'package:chat_apps_gochat/pages/chats/chats_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRecordView extends StatelessWidget {

  final chatController = Get.put(ChatsController());
  final ChatRoomModel chatsModel;
  ChatRecordView(this.chatsModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(chatsModel.username!),
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
          if(chatController.showEmoji.isTrue){
            chatController.showEmoji.value == false;
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
                // Obx(() {
                //   return 
                  ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: chatController.chatRecordModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatRecordTile(index,chatController.chatRecordModel[index]);
                    },
                  )
                // }),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: chatController.showEmoji.isTrue
              ? 5
              : context.mediaQueryPadding.bottom
            ),
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
                        focusNode: chatController.focusNode,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(
                          fontSize: 16
                        ),
                        enableInteractiveSelection: true,
                        onChanged: (value) => chatController.checkTextField(),
                        keyboardType: TextInputType.emailAddress,
                        controller: chatController.messageController,
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
                    onPressed: chatController.isTyping.value == true
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
          Obx(() =>(chatController.showEmoji.isTrue)
            ? Container(
                alignment: Alignment.bottomCenter,
                height: screenHeight/3,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    chatController.addEmoji(emoji);
                  },
                  onBackspacePressed: () {
                    chatController.deleteEmoji();
                  },
                  config: Config(
                      columns: 7,
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      progressIndicatorColor: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecentsText: "No Recents",
                      noRecentsStyle:
                          const TextStyle(fontSize: 20, color: Colors.black26),
                      tabIndicatorAnimDuration: kTabScrollDuration,    
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL
                  ),
                ),
              )
            : const SizedBox(),
          )
        ],
      ),
    );
  }
}