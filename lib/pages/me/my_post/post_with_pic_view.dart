import 'dart:io';

import 'package:chat_apps_gochat/pages/me/my_post/my_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostWithPictureView extends StatelessWidget {

  final myPostController = Get.put(MyPostController());

  PostWithPictureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Discard Your Changes'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                },
                child: const Text('Exit',
                  style: TextStyle(
                    color: Colors.red,
                  ),)
              ),
            ],
          ));
        return willLeave;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: screenWidth/7,
                height: screenHeight/15,
                color: Colors.blue,
                onPressed: (){
                  myPostController.addPostWithPic(myPostController.base64Image);
                }, 
                child: const Text("Post",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),)
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: myPostController.contentController,
                  decoration: InputDecoration(
                    hintText: "Say something...".tr,
                  ),
                ),),
              const SizedBox(height: 20),
              Obx(() => myPostController.compressImagePath.value == ''
                ? const Text("Please select a photo")
                : Image.file(
                    File(myPostController.cropImagePath.value),
                      width: double.infinity,
                      height: 300,
                  ),
              ),
              const SizedBox(height: 10),
              Obx(() => myPostController.compressImageSize.value == ''
                ? const Text("")
                : Text(myPostController.compressImageSize.value,
                    style: const TextStyle(fontSize:20),
                  ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: screenWidth/4,
                height: screenHeight/18,
                color: Colors.blue,
                onPressed: () {
                  myPostController.getImage(ImageSource.camera);
                },
                child: const Text("Camera",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: screenWidth/4,
                height: screenHeight/18,
                color: Colors.blue,
                onPressed: () {
                  myPostController.getImage(ImageSource.gallery);
                },
                child: const Text("Gallery",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}