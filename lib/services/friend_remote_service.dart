import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FriendRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();
  static String email = email = appData.read("keepLogin")??'';

  static Future<List<Friend>?> fetchFriend(String email) async {

    print("a");

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_friend.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return friendFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }
}