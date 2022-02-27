import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/friend_remote_service.dart';
import 'package:chat_apps_gochat/services/request_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactsController extends GetxController{

  static final appData = GetStorage();

  var requestList = <FriendRequest>[].obs;
  var friendList = <Friend>[].obs;
  late String email;
  var isLoading = true.obs;
  var isSearching = false.obs;
  var isTyping = false.obs;
  var searchResult = false.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadFriendList();
    loadFriendRequest();
    super.onInit();
  }

  void loadFriendList() async{

    try {
      isLoading(true);
      var friend = await FriendRemoteServices.fetchFriend();
      if (friend != null) {
        friendList.assignAll(friend);
        // print(postList);
      } else {
        statusMsj("No any friend".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void loadFriendRequest() async{

    email = appData.read("keepLogin")??'';

    try {
      // isLoading(true);
      var request = await RequestRemoteServices.fetchRequest(email);
      if (request != null) {
        requestList.assignAll(request);
      } else {
        statusMsj("No any friend request".tr);
      }
    } finally {
      // isLoading(false);
    }
  }
  
  late TextEditingController searchPhoneController = TextEditingController();

  void isSearchingContact(bool searching){

    searching == false 
    ? isSearching.value = true
    : isSearching.value = false;
    print(isSearching.value);
  }

  void checkTextField(){

    searchPhoneController.text.isEmpty
      ? isTyping.value = false
      : isTyping.value = true;
  }

  void clearTextField(){
    searchPhoneController.clear();
    isTyping.value = false;
    statusMsj("Search_Product".tr);
  }

  void navigateNewFriendsPage(){

    Get.toNamed(AppRoutes.NewFriendsPage);
  }

  void navigateNewRequestsPage(){

    Get.toNamed(AppRoutes.NewRequestPage);
    Get.delete<ContactsController>();
  }
}