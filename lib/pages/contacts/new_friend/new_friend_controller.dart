import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFriendController extends GetxController{

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
  ];

  var isSearching = false.obs;
  var isTyping = false.obs;
  var searchResult = false.obs;
  var contactList = <Contacts>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  
  late TextEditingController searchPhoneController = TextEditingController();

  @override
  void onInit() {
    loadSearchPage();
    super.onInit();
  }

  void loadSearchPage() {

    try {
      isLoading(true);
      if (contactList.isEmpty) {
        statusMsj("".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchUser() async {

    String phoneNo = searchPhoneController.text.toString();
    print(phoneNo);

    try {
      isLoading(true);
      var contact = await UserRemoteServices.searchUser(phoneNo);
      if (contact != null) {
        contactList.assignAll(contact);
        searchResult.value = true;
      } else {
        // productList = null;
        searchResult.value = false;
        statusMsj("Not Found".tr);
      }
    } finally {
      isLoading(false);
    }

    isTyping.value = false;
    searchPhoneController.clear();
  }

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
    statusMsj("Search User".tr);
  }

  void navigateAddUserView(){

    
  }
}