import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/services/chat_remote_services.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactsChatController extends GetxController{

  late TextEditingController messageController;

  late FocusNode focusNode;
  static final appData = GetStorage();
  late String email;
  late String friendEmail;

  var chatList = <Chat>[].obs;
  var userDetails = <User>[].obs;

  var statusMsj = "Loading".obs;

  var isTyping = false.obs;
  var showEmoji = false.obs;
  var phoneNo = "".obs;
  var text = ''.obs;

  @override
  void onInit() {
    messageController = TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        showEmoji.value = false;
      }
    });
    loadChatList();
    loadUser();
    super.onInit();
  }

  @override
  void onClose() {
    messageController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  void loadChatList() async{

    friendEmail = appData.read("friendEmail")??'';
    email = appData.read("keepLogin")??'';

    var chat = await ChatRemoteServices.fetchChat(email, friendEmail);
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

  void sendMessage(String friendEmail){

    email = appData.read("keepLogin")??'';
    String message = messageController.text.toString();

    ChatRemoteServices.sendMessage(email, friendEmail, message);
    messageController.clear();
    loadChatList();
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