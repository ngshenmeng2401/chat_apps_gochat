import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{


  late TextEditingController emailController = TextEditingController();
  late TextEditingController userNameController = TextEditingController();
  late TextEditingController phoneNoController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();

  var isTyping = false.obs;

  void navigateLoginView(){

    Get.offNamed(AppRoutes.Login);
  }

  void checkTextField(){

    if(emailController.text.isEmpty || userNameController.text.isEmpty || phoneNoController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty){

      isTyping.value = false;

    }else{
      isTyping.value = true;
    }
  }

  void signUpDialog(){

    Get.defaultDialog(
      title: "Are you sure".tr,
      content: Column(
        children: const [
          Padding(padding: EdgeInsets.all(0)),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        signUp();
      },
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void signUp(){

    String email = emailController.text.toString();
    String username = userNameController.text.toString();
    String phoneNo = phoneNoController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();

    UserRemoteServices.signUpUser(email,username,phoneNo,password);
      
  }
}