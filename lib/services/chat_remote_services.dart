import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/model/chatroom_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChatRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();

  static Future<String?> sendMessage(String email, String friendEmail , String messageText) async {
    
    print(email);
    print(friendEmail);
    print(messageText);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/send_message.php'), 
      body: {
      "email" : email,
      "friendEmail" : friendEmail,
      "messageText" : messageText,
    });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Send Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Send Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<List<Chatroom>?> fetchChatroom(String email) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_chatroom.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return chatroomFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<Chat>?> fetchChat(String email, String friendEmail) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_chat.php"),
      body: {
        "email":email,
        "friendEmail":friendEmail,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return chatFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<Chat>?> fetchChat2(String chatroomId) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_chat2.php"),
      body: {
        "chatroomId":chatroomId,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return chatFromJson(jsonString);
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