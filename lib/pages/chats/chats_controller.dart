import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/pages/chats/chat_record_view.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController{

  final chatRoomModel = <ChatRoomModel>[

    ChatRoomModel(
      username: "Weng Kee",
      img: "assets/images/p1.png",
      chat: "晚安",
      time: "12:26 am",
      mute: false,
    ),
    ChatRoomModel(
      username: "Jimmy Tan",
      img: "assets/images/p2.jpg",
      chat: "ok",
      time: "2:15 pm",
      mute: false,
    ),
    ChatRoomModel(
      username: "Jia Earn",
      img: "assets/images/p3.jpg",
      chat: "yaya",
      time: "3:56 pm",
      mute: false,
    ),
    ChatRoomModel(
      username: "Suan Ming",
      img: "assets/images/p4.jpg",
      chat: "我直接等jimmy排了",
      time: "4:49 pm",
      mute: false,
    ),
    ChatRoomModel(
      username: "Star Goh",
      img: "assets/images/p5.jpg",
      chat: "Haiyah",
      time: "10:26 pm",
      mute: false,
    ),
    ChatRoomModel(
      username: "Qian Yi",
      img: "assets/images/p1.png",
      chat: "吃鸡咯",
      time: "11:39 pm",
      mute: false,
    ),
    ChatRoomModel(
      username: "Mingger",
      img: "assets/images/p2.jpg",
      chat: "okok",
      time: "9:41 pm",
      mute: false,
    ),
  ];

  final chatRecordModel = <ChatRecordModel>[

    ChatRecordModel(
      username: "Weng Kee",
      img: "assets/images/p1.png",
      message: "hi",
      time: "9:41 am",
    ),
    ChatRecordModel(
      username: "Shen Meng",
      img: "assets/images/p2.jpg",
      message: "hihi",
      time: "9:42 am",
    ),
    ChatRecordModel(
      username: "Weng Kee",
      img: "assets/images/p1.png",
      message: "At W3Schools you will find complete references about HTML elements, attributes, events, color names, entities, character-sets, URL encoding, language codes, HTTP messages, browser support, and more:",
      time: "9:43 am",
    ),
    ChatRecordModel(
      username: "Shen Meng",
      img: "assets/images/p2.jpg",
      message: "At W3Schools you will find complete references about HTML elements, attributes, events, color names, entities, character-sets, URL encoding, language codes, HTTP messages, browser support, and more:",
      time: "9:44 am",
    ),
  ];

  late TextEditingController messageController;

  late FocusNode focusNode;

  var isTyping = false.obs;
  var showEmoji = false.obs;

  @override
  void onInit() {
    messageController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        showEmoji.value = false;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void addEmoji(Emoji emoji) {
    messageController.text = messageController.text + emoji.emoji;
  }

  void deleteEmoji(){

    for(int i=0; i < messageController.text.length; i++){
      print(messageController.text[i]);
    }
    messageController.text = messageController.text.substring(0, messageController.text.length - 2);
  }

  void checkTextField(){

    messageController.text.isEmpty
      ? isTyping.value = false
      : isTyping.value = true;
  }

  void navigateChatRecordView(ChatRoomModel chatsRoomModel){

    Get.to(() => ChatRecordView(chatsRoomModel));
  }
}