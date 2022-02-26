import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  var isSearching = false.obs;
  var isTyping = false.obs;
  var searchResult = false.obs;
  var statusMsj = "Loading".obs;
  
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
  }
}