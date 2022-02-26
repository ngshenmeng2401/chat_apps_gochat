import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/request_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactsController extends GetxController{

  final contactsModel = <ContactsModal>[

    ContactsModal(
      username: "Weng Kee",
      img: "assets/images/p1.png",
    ),
    ContactsModal(
      username: "Jimmy Tan",
      img: "assets/images/p2.jpg",
    ),
    ContactsModal(
      username: "Jia Earn",
      img: "assets/images/p3.jpg",
    ),
    ContactsModal(
      username: "Suan Ming",
      img: "assets/images/p4.jpg",
    ),
    ContactsModal(
      username: "Star Goh",
      img: "assets/images/p5.jpg",
    ),
    ContactsModal(
      username: "Qian Yi",
      img: "assets/images/p1.png",
    ),
    ContactsModal(
      username: "Mingger",
      img: "assets/images/p2.jpg",
    ),
  ];

  static final appData = GetStorage();

  var requestList = <FriendRequest>[].obs;
  late String email;
  var isSearching = false.obs;
  var isTyping = false.obs;
  var searchResult = false.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadFriendRequest();
    super.onInit();
  }

  void loadFriendRequest() async{

    email = appData.read("email")??'';

    try {
      // isLoading(true);
      var request = await RequestRemoteServices.fetchRequest(email);
      if (request != null) {
        requestList.assignAll(request);
        // print(postList);
      } else {
        // productList = null;
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