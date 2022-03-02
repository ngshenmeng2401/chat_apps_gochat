import 'package:chat_apps_gochat/model/comment_model.dart';
import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/services/moment_remote_service.dart';
import 'package:chat_apps_gochat/services/post_remote_service.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class MomentsController extends GetxController{

  static final appData = GetStorage();
  var momentList = <Moment>[].obs;
  var userDetails = <User>[].obs;
  var commentList = <Comment>[].obs;

  late TextEditingController commentController = TextEditingController();
  late String email;

  var phoneNo = "".obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var optionList = [].obs;
  var optionBox = false.obs;
  var commentBoxList = [].obs;
  var isComment = false.obs;
  var isTyping = false.obs;
  var commentOptionList = [].obs;
  var text = ''.obs;

  @override
  void onInit() {
    loadMomentList();
    loadUser();
    loadCommentList();
    super.onInit();
  }

  void loadMomentList() async{

    email = appData.read("keepLogin")??'';

    
    var moment = await MomentRemoteServices.fetchMoment(email);
    if (moment != null) {
      momentList.clear();
      momentList.assignAll(moment);
      for(int i = 0; i < momentList.length; i++) {

        optionList.insert(i, false);
        commentBoxList.insert(i, false);
      }
    } else {
      statusMsj("No any post".tr);
    }
  }

  void loadCommentList() async{

    email = appData.read("keepLogin")??'';

    isLoading(true);
    var comment = await MomentRemoteServices.fetchComment(email);
    if (comment != null) {
      commentList.clear();
      commentList.assignAll(comment);

      for(int i = 0; i < commentList.length; i++){
        commentOptionList.insert(i, false);
      }
    } else {
      statusMsj("No any comment".tr);
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

  void displayLikeComment(bool option, int index){
    
    option == false 
    ? optionList[index] = true
    : optionList[index] = false;
  }

  void displayCommentBox(bool comment, int index){
    // print(comment);
    if(comment == false){

      commentBoxList[index] = true;
      optionList[index] = false;

    }else{
      commentBoxList[index] = false;
    }
  }

  void displayCommentOption(bool commentOption, int index){

    if(commentOption == false){

      commentOptionList[index] = true;

    }else{
      commentOptionList[index] = false;
    }
  }

  void closeCommentBox(int index){
    commentController.clear();
    commentBoxList[index] = false;
  }

  void checkTextField(){

    commentController.text.isEmpty
      ? isTyping.value = false
      : isTyping.value = true;
  }

  void sendCommentPost(String postId,int index){

    String comment = commentController.text.toString();
    email = appData.read("keepLogin")??'';

    MomentRemoteServices.addComment(postId, email, comment);

    commentController.clear();
    commentBoxList[index] = false;
    Future.delayed(const Duration(seconds: 1), () {
      loadCommentList();
    });
  }

  void deleteComment(String commentId,int index) {

    email = appData.read("keepLogin")??'';

    MomentRemoteServices.deleteComment(commentId, email);
    
    Future.delayed(const Duration(milliseconds: 500), () {
      loadCommentList();
    });
  }

  void deletePost(String postId, String imgStatus){

    email = appData.read("keepLogin")??'';

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        momentList.clear(),
        PostRemoteServices.deletePost(email, postId, imgStatus),
        Future.delayed(const Duration(milliseconds: 500), () {
          loadMomentList();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  pasteText() async {
    ClipboardData? clipborad = await Clipboard.getData('text/plain');
    text.value = clipborad!.text!;
    commentController.text = text.value;
  }
}