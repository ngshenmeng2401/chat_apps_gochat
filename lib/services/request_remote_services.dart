import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RequestRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();

  static Future<List<FriendRequest>?> fetchRequest(String friendEmail) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_friend_request.php"),
      body: {
        "friendEmail":friendEmail,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return friendRequestFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }
  
  static Future<String?> addRequest(String email, String friendEmail , String requestText) async {
    
    print(email);
    print(friendEmail);
    print(requestText);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/add_friend_request.php'), 
      body: {
      "email" : email,
      "friendEmail" : friendEmail,
      "requestText" : requestText,
    });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Post Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Post Failed", "Please check your input value.");
      return null;
      // throw Exception("Error");
    }
  }

  static Future<String?> acceptRequest(String email, String friendEmail) async {
    
    print(email);
    print(friendEmail);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/accept_request.php'), 
      body: {
      "email" : email,
      "friendEmail" : friendEmail,
    });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Post Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Post Failed", "Please check your input value.");
      return null;
      // throw Exception("Error");
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