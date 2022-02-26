import 'package:chat_apps_gochat/widget/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(() => BottomNavigationBarController());
    // Get.lazyPut<ChatsController>(() => ChatsController());
    // Get.lazyPut<SearchController>(() => SearchController());
  }
}