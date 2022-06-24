import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();

  static Future<String?> signUpUser(String email, String username , String phoneNo, String password) async {
    
    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/gochat/php/signup_user.php'), 
      body: {
      "email" : email,
      "username" : username,
      "phoneNo" : phoneNo,
      "password" : password,
    });
    // print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Register Successful", "Please check your email to activate your account.");

      return resp;
    } else {
      // show error message
      getSnackBar("Register Failed", "Please check your input value.");
      return null;
      // throw Exception("Error");
    }
    
  }

  static Future<String?> loginUser(String email, String password) async {

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/gochat/php/login_user.php'), 
      body: {
      "email" : email,
      "password" : password,
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      if (response.body == "failed"){

        getSnackBar("Login Failed", "Please check your input value.");

      }else{

        checkLogin(email, password);

      }
      return resp;
    } else {

      //show error message
      return null;
    }
  }

  static void checkLogin(email, password) {

    if(email != "" && password != ""){

      appData.write("isLogged", true);
      appData.write("keepLogin", email);

      getSnackBar("Login Success", "Welcome To GoChat");

      Get.offNamed(AppRoutes.BottomNavigation);

    }else {

      getSnackBar("Error", "Please enter your email and password !!!");
    }

  }

  static Future<List<User>?> fetchUser(String email) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/gochat/php/load_user.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return userFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<String?> editUser(String? email ,String? username , String? newPhoneNo, String? oldPhoneNo) async {

    if(username!.isEmpty){
      username = "username";
    }else if(newPhoneNo!.isEmpty){ 
      newPhoneNo = "phoneNo";
    }


    print(username);
    print(oldPhoneNo);
    print(newPhoneNo);
    
    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/gochat/php/edit_user.php'), 
      body: {
      "email" : email,
      "username" : username,
      "newPhoneNo" : newPhoneNo,
      "oldPhoneNo" : oldPhoneNo,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");
      return resp;
    } else {
      // show error message

      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
      // throw Exception("Error");
    }
  }

  static Future<String?> editProfilePic(String? email ,String? image, String phoneNo) async{

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/gochat/php/edit_profile_pic.php'), 
      body: {
      "email" : email,
      "image" : image,
      "phoneNo" : phoneNo,
    });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Upload Successful", "");
      return resp;
    } else {
      // show error message

      getSnackBar("Upload Failed", "Please check your image.");
      return null;
      // throw Exception("Error");
    }
  }
  
  static Future<List<Contacts>?> searchUser(String phoneNo, String email) async {

    print(phoneNo);
    print(email);

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/gochat/php/search_user.php"),
      body: {
        "email":email,
        "phoneNo":phoneNo,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return contactsFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static void getSnackBar(String title, String subtitle){

    Get.snackbar(
      title,subtitle,
      backgroundColor: Colors.white60,
      colorText: Colors.black,
      icon: const Icon(Icons.error, color: Colors.black),
      snackPosition: SnackPosition.TOP,  
    );
  }
}