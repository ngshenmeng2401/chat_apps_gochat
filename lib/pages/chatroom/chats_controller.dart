import 'package:chat_apps_gochat/model/chatroom_model.dart';
import 'package:chat_apps_gochat/pages/chatroom/chat/chat_record_view.dart';
import 'package:chat_apps_gochat/services/chat_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatsController extends GetxController{

  static final appData = GetStorage();

  late FocusNode focusNode;

  var isTyping = false.obs;
  var showEmoji = false.obs;
  var chatroomList = <Chatroom>[].obs;
  
  late String email;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        showEmoji.value = false;
      }
    });
    loadChatroomList();
    super.onInit();
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }

   void loadChatroomList() async{

    email = appData.read("keepLogin")??'';

    try {
      isLoading(true);
      var chatroom = await ChatRemoteServices.fetchChatroom(email);
      if (chatroom != null) {
        chatroomList.clear();
        chatroomList.assignAll(chatroom);
        // print(postList);
      } else {
        statusMsj("No any friend".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void navigateChatRecordView(Chatroom chatroom){

    appData.write("chatRoomId", chatroom.chatRoomId);

    Get.to(() => ChatRecordView(chatroom));
  }
}