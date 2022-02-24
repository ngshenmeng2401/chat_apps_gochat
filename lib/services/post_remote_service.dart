import 'package:chat_apps_gochat/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostRemoteServices {

  static final appData = GetStorage();
  static var client = http.Client();

  static Future<List<Post>?> fetchPost(String email) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_post.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return postFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<String?> addPost(String email, String encodedString , String content, String type) async {
    
    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/add_post.php'), 
      body: {
      "email" : email,
      "encoded_string" : encodedString,
      "content" : content,
      "type" : type,
    });
    print(response.body);
    if (response.statusCode == 200) {
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

  static Future<String?> deletePost(String postId, String imgStatus) async {
    
    print(postId);
    print(imgStatus);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/delete_post.php'), 
      body: {
      "postId" : postId,
      "imgStatus" : imgStatus,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      
      getSnackBar("Delete Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Delete Failed", "Please check your input value.");
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