import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/model/friend_request_model.dart';
import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_details/contact_details.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/friend_remote_service.dart';
import 'package:chat_apps_gochat/services/moment_remote_service.dart';
import 'package:chat_apps_gochat/services/request_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactsController extends GetxController{

  static final appData = GetStorage();

  var requestList = <FriendRequest>[].obs;
  var friendList = <Friend>[].obs;
  var momentList = <Moment>[].obs;
  
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
    loadMomentList();
    super.onInit();
  }

  void loadFriendList() async{

    email = appData.read("keepLogin")??'';

    try {
      isLoading(true);
      var friend = await FriendRemoteServices.fetchFriend(email);
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

  void loadFriendRequest() async{

    email = appData.read("keepLogin")??'';
    requestList.clear();

    var request = await RequestRemoteServices.fetchRequest(email);
    if (request != null) {
      requestList.assignAll(request);
    } else {
      statusMsj("No any friend request".tr);
    }
    
  }

  void loadMomentList() async{

    email = appData.read("keepLogin")??'';

    
    var moment = await MomentRemoteServices.fetchMoment(email);
    if (moment != null) {
      momentList.clear();
      momentList.assignAll(moment);
    } else {
      statusMsj("No any post".tr);
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

  void loadAllList(){

    loadFriendRequest();
    loadFriendList();
  }

  void navigateNewFriendsPage(){

    Get.toNamed(AppRoutes.NewFriendsPage);
  }

  void navigateNewRequestsPage(){

    Get.toNamed(AppRoutes.NewRequestPage)!.then((value) => loadAllList());
    Get.delete<ContactsController>();
  }

  void navigateContactDetails(Friend friend){

    print(friend.friendEmail);
    appData.write("friendEmail", friend.friendEmail);
    Get.to(() => ContactDetailsView(friend));
  }
}