import 'dart:io';
import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePicView extends StatelessWidget {

  final editProfileController = Get.put(EditProfileController());
  final String phoneNo;
  EditProfilePicView(this.phoneNo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile Picture".tr),
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
                // editProfileController.editPhoneNo();
              }, 
              child: const Text("Edit",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),)
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Obx(() => editProfileController.compressImagePath.value == ''
                  ? Image.asset("assets/images/p1.png")
                  : Image.file(
                      File(editProfileController.cropImagePath.value),
                        width: double.infinity,
                        height: 300,
                    ),
                ),
                const SizedBox(height: 10),
                Obx(() => editProfileController.compressImageSize.value == ''
                  ? const Text("")
                  : Text(editProfileController.compressImageSize.value,
                      style: const TextStyle(fontSize:20),
                    ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  minWidth: screenWidth/4,
                  height: screenHeight/18,
                  color: Colors.blue,
                  onPressed: () {
                    editProfileController.getImage(ImageSource.camera, phoneNo);
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
                    editProfileController.getImage(ImageSource.gallery, phoneNo);
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
      ),
    );
  }
}