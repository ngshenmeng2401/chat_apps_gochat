import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/request_user_details.dart';
import 'package:chat_apps_gochat/services/request_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewRequestController extends GetxController{

  static final appData = GetStorage();

  var requestList = <FriendRequest>[].obs;
  late String email;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadFriendRequest();
    super.onInit();
  }

  void loadFriendRequest() async{

    email = appData.read("keepLogin")??'';

    try {
      isLoading(true);
      var request = await RequestRemoteServices.fetchRequest(email);
      if (request != null) {
        requestList.assignAll(request);
        // print(postList);
      } else {
        // productList = null;
        statusMsj("No any friend request".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void acceptRequestDialog(String email, String friendEmail){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        RequestRemoteServices.acceptRequest(email, friendEmail),
        Future.delayed(const Duration(seconds: 2), () {
          loadFriendRequest();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateRequestUserDetails(FriendRequest friendRequest){

    Get.to(() => RequestUserDetails(friendRequest));
  }
}