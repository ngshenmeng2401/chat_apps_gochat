import 'package:chat_apps_gochat/pages/chatroom/chats_controller.dart';
import 'package:chat_apps_gochat/pages/contacts/contacts_controller.dart';
import 'package:chat_apps_gochat/pages/discover/discover_controller.dart';
import 'package:chat_apps_gochat/pages/me/me_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();

    if(tabIndex == 0){

      Get.delete<ContactsController>();
      Get.delete<DiscoverController>();
      Get.delete<ProfileController>();

    }else if(tabIndex == 1){

      Get.delete<ChatsController>();
      Get.delete<DiscoverController>();
      Get.delete<ProfileController>();

    }else if(tabIndex == 2){

      Get.delete<ChatsController>();
      Get.delete<ContactsController>();
      Get.delete<ProfileController>();

    }else if(tabIndex == 3){

      Get.delete<ChatsController>();
      Get.delete<ContactsController>();
      Get.delete<DiscoverController>();

    }
  }
}