import 'package:chat_apps_gochat/model/comment_model.dart';
import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MomentRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();

  static Future<List<Moment>?> fetchMoment(String email) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_moment.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return momentFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<Comment>?> fetchComment(String email) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_comment.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          // print("IN remoteservices" + jsonString);
          return commentFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<String?> addComment(String postId, String email , String comment) async {
    
    print(postId);
    print(email);
    print(comment);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/add_comment.php'), 
      body: {
      "postId" : postId,
      "email" : email,
      "comment" : comment,
    });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Comment Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Comment Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> deleteComment(String commentId, String email) async {
    
    print(commentId);
    print(email);

    var response = await client.post(

      Uri.parse('https://javathree99.com/s271059/gochat/php/delete_comment.php'), 
      body: {
      "commentId" : commentId,
      "email" : email,
    });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Delete Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Delete Failed", "Please check your input value.");
      return null;
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