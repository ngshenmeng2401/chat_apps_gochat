import 'dart:async';

import 'package:chat_apps_gochat/model/chatroom_model.dart';
import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/pages/chatroom/chat/chat_record_view.dart';
import 'package:chat_apps_gochat/pages/chatroom/friend_tile.dart';
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
  var chatroomList2 = <Chatroom>[].obs;
  var friendList = <Friend>[].obs;
  
  late String email;
  late Timer? timer;
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
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadChatroomList());
    loadFriendList();
    super.onInit();
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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

  void loadFriendList() async{

    email = appData.read("keepLogin")??'';

    try {
      isLoading(true);
      var friend = await ChatRemoteServices.fetchFriend(email);
      if (friend != null) {
        friendList.clear();
        friendList.assignAll(friend);
        // print(postList);
      } else {
        statusMsj("No any friend".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void displayFriendList(double screenHeight, double screenWidth){

    Get.defaultDialog(
      title: "Friends".tr,
      content: Column(
        children: [
          SizedBox(
            width: screenWidth/1.6,
            height: screenHeight/3.5,
            child: ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: friendList.length, 
              itemBuilder: (BuildContext context, int index) {
                return FriendTile(index, friendList[index]);
              },
            )
          ),
        ],
      ),
      textCancel: "Close".tr,
      onConfirm: null,
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void createChatroom(String friendEmail) async {

    email = appData.read("keepLogin")??'';

    var chatroom = await ChatRemoteServices.createChatroom(email, friendEmail);

    if (chatroom != null) {
      chatroomList2.assignAll(chatroom);
      for(int i = 0; i < chatroomList2.length; i++){
        // print(chatroomList2[i].chatRoomId);
        // print(chatroomList2[i].username);
        navigateChatRecordView(chatroomList2[i]);
      }
    }
    Future.delayed(const Duration(milliseconds: 1000), () {
      loadChatroomList();
      loadFriendList();
    });
    
  }

  void navigateChatRecordView(Chatroom chatroom){

    appData.write("chatRoomId", chatroom.chatRoomId);
    appData.write("receiverEmail", chatroom.receiverEmail);

    print(chatroom.receiverEmail);
    print(chatroom.chatRoomId);

    Get.to(() => ChatRecordView(chatroom))!.then((value) => {
      loadChatroomList(),
      loadFriendList(),
    });
  }
}