import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/request_view.dart';
import 'package:chat_apps_gochat/services/request_remote_services.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewFriendController extends GetxController{

  final appData = GetStorage();
  late String email;

  var contactList = <Contacts>[].obs;
  var userDetails = <User>[].obs;

  var isSearching = false.obs;
  var isTyping = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var phoneNo = "".obs;
  
  late TextEditingController searchPhoneController = TextEditingController();
  late TextEditingController requestController = TextEditingController()..text = "Hi, I am";

  @override
  void onInit() {
    loadUser();
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

    String searchPhoneNo = searchPhoneController.text.toString();
    email = appData.read("keepLogin")??'';
    contactList.clear();

    print(phoneNo);

    if(searchPhoneNo == phoneNo.value){
      Get.snackbar(
        "Error","Can't search own phone no",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else{

      try {
        isLoading(true);
        var contact = await UserRemoteServices.searchUser(searchPhoneNo, email);
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
    }

    isTyping.value = false;
    searchPhoneController.clear();
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

  void sendFriendRequest(String friendEmail){

    String requestText = requestController.text.toString();
    String email = appData.read("email")??'';

    // print(requestText);
    // print(email);
    // print(friendEmail);

    if(requestText.isEmpty){

      Get.snackbar("Error", "Please write request text.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );

    }else{

      RequestRemoteServices.addRequest(email, friendEmail, requestText);

    }
  }

  void navigateAddUserView(Contacts contacts){

    Get.to(() => RequestView(contacts));
  }
}