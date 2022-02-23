import 'dart:async';

import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{

  final appData = GetStorage();

  @override
  void onReady() {
    appData.writeIfNull('isLogged', false);
    super.onReady();
    loading();
  }

  Future<void> loading() async {

    Timer(const Duration(seconds: 3), () {

      appData.read('isLogged') ? Get.offAllNamed(AppRoutes.BottomNavigation) : Get.offAllNamed(AppRoutes.Login);
    
    }
    
    );
  }
}