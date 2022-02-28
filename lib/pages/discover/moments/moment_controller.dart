import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/services/moment_remote_service.dart';
import 'package:chat_apps_gochat/services/post_remote_service.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class MomentsController extends GetxController{

  static final appData = GetStorage();
  var momentList = <Moment>[].obs;
  var userDetails = <User>[].obs;
  late String email;
  var phoneNo = "".obs;
  var isLoading = true.obs;
  var isSearching = false.obs;
  var isTyping = false.obs;
  var searchResult = false.obs;
  var statusMsj = "Loading".obs;
  DateTime now = DateTime.now();
  var isOption = false.obs;

  @override
  void onInit() {
    loadMomentList();
    loadUser();
    super.onInit();
  }

  void loadMomentList() async{

    email = appData.read("keepLogin")??'';

    try {
      isLoading(true);
      var moment = await MomentRemoteServices.fetchMoment(email);
      if (moment != null) {
        momentList.clear();
        momentList.assignAll(moment);
        print(momentList.length);
      } else {
        statusMsj("No any friend".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String> loadUser() async{

    email = appData.read("keepLogin")??'';

    var user = await UserRemoteServices.fetchUser(email);
    if (user != null) {
      userDetails.assignAll(user);
      phoneNo.value = userDetails[0].phoneNo!;
    } else {
      // productList = null;
      statusMsj("No_data".tr);
    }
    return phoneNo.value;
  }

  void displayLikeComment(bool option){

    option == false 
    ? isOption.value = true
    : isOption.value = false;
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
}