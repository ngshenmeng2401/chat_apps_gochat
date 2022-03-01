import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  late TextEditingController emailController, passwordController, forgotPasswordEmailController;

  final appData = GetStorage(); 

  var email = '';
  var password = '';
  var rememberMe = false;
  var isTyping = false.obs;

  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    forgotPasswordEmailController = TextEditingController();
    loadPreference();
    checkTextField();
  }

  void checkTextField(){

    if(emailController.text.isEmpty || passwordController.text.isEmpty){

      isTyping.value = false;

    }else{
      isTyping.value = true;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void navigateSignUpView(){

    Get.offNamed(AppRoutes.Signup);
  }

  void storePosition(position){

    appData.write("position", position);
  }

  void rememberEmailPassword (value, email, password){


    if(email.isEmpty || password.isEmpty){

      Get.snackbar(
        "Error","Email Password is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      return;
    }
    rememberMe = value;
    // print(rememberMe);
    storePreference(value, email, password);
    update();
  }

  Future<void> storePreference(bool value,String email, String password) async {
    
    if(value==true){

      appData.write("email", email);
      appData.write("password", password);
      appData.write("rememberme", value);

      Get.snackbar(
        "Message","Email Password stored",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      isTyping.value = true;
    return;
    }else{  
      
      appData.write("email", '');
      appData.write("password", '');
      appData.write("rememberme", value);

      Get.snackbar(
        "Message","Removed Email Password",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      emailController.text = "";
      passwordController.text = "";
      rememberMe = false ;
      update();
      isTyping.value = false;
      return;
    }
  }

  Future<void> loadPreference()async {

    String email = appData.read("email")??'';
    String password = appData.read("password")??'';
    rememberMe= (appData.read("rememberme")??false);

    emailController.text=email;
    passwordController.text=password;
    update();
  }

  void forgotPasswordDialog(){

    Get.defaultDialog(
      title: "Forgot Your Password".tr,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            child: TextField(
              controller: forgotPasswordEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email".tr
              ),
            ),
          )
        ],
      ),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => Get.back(),
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void loginUser(){

    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    UserRemoteServices.loginUser(emailController.text.toString(), passwordController.text.toString());
    
  }
}