import 'dart:async';

import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/services/chat_remote_services.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatRecordController extends GetxController{

  static final appData = GetStorage();
  late TextEditingController messageController;
  var isTyping = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var phoneNo = "".obs;
  var text = ''.obs;

  late String email;
  late String chatRoomId;
  late String receiverEmail;
  late Timer? timer;

  late FocusNode focusNode;

  var chatList = <Chat>[].obs;
  var userDetails = <User>[].obs;

  @override
  void onInit() {
    focusNode = FocusNode();
    messageController = TextEditingController();
    loadUser();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadChatList());
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

  void loadChatList() async{

    chatRoomId = appData.read("chatRoomId")??'';
    // email = appData.read("keepLogin")??'';
    receiverEmail = appData.read("receiverEmail")??'';

    var chat = await ChatRemoteServices.fetchChat2(receiverEmail, chatRoomId);
    if (chat != null) {
      chatList.clear();
      chatList.assignAll(chat);
    } else {
      statusMsj("No any chat".tr);
    }
  }

  Future<String> loadUser() async{

    email = appData.read("keepLogin")??'';

    var user = await UserRemoteServices.fetchUser(email);
    if (user != null) {
      userDetails.assignAll(user);
      phoneNo.value = userDetails[0].phoneNo!;
    } else {
      statusMsj("No_data".tr);
    }
    return phoneNo.value;
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

  copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  pasteText() async {
    ClipboardData? clipborad = await Clipboard.getData('text/plain');
    text.value = clipborad!.text!;
    messageController.text = text.value;
  }
}