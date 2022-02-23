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

  void navigateLoginView(){

    Get.offNamed(AppRoutes.Login);
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
        checkSignUp();
      },
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void checkSignUp(){

    String email = emailController.text.toString();
    String username = userNameController.text.toString();
    String phoneNo = phoneNoController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();

    if(email.isEmpty && username.isEmpty && phoneNo.isEmpty && password.isEmpty && confirmPassword.isEmpty){

      Get.snackbar(
        "Error","Please fill in all textfield",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );
    
    }else if (email.isEmpty){

      Get.snackbar(
        "Error","Email is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (username.isEmpty){

      Get.snackbar(
        "Error","Username is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (phoneNo.isEmpty){

      Get.snackbar(
        "Error","Phone No is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (password.isEmpty || confirmPassword.isEmpty){

      Get.snackbar(
        "Error","Password is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (password!=confirmPassword || confirmPassword!=password){

      Get.snackbar(
        "Error","Both password is different",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else{

      UserRemoteServices.signUpUser(email,username,phoneNo,password);
      
    }
  }
}