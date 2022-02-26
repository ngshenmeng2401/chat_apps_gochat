import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/request_user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRequestController extends GetxController{

  final requestModel = <RequestModal>[

    RequestModal(

      friendEmail: "jimmytan@gmail.com",
      email: "meng@gmail.com",
      requestMessage: "Hi, I am big mouth.",
    ),
    RequestModal(

      friendEmail: "john@gmail.com",
      email: "meng@gmail.com",
      requestMessage: "Hi, I am John.",
    ),
    RequestModal(

      friendEmail: "chloetan@gmail.com",
      email: "meng@gmail.com",
      requestMessage: "Hi, I am Chloe.",
    ),
  ];

  void acceptRequestDialog(){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateRequestUserDetails(RequestModal requestModel){

    Get.to(() => RequestUserDetails(requestModel));
  }
}