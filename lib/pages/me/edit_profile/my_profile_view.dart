import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_controller.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/my_profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileView extends StatelessWidget {

  final editProfileController = Get.put(EditProfileController());

  MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: screenHeight/8,
              child: Obx(() {
                return ListView.builder(
                  itemCount: editProfileController.userDetails.length,
                  itemBuilder: (context, index) {
                    return EditProfileMenu(
                      title: "Profile Picture",
                      text: "Img",
                      press: (){
                        editProfileController.navigateEditProfilePicVIew(editProfileController.userDetails[index].phoneNo!);
                      },
                      imgStatus: editProfileController.userDetails[index].imgStatus,
                      hasImage: true,
                      img: editProfileController.userDetails[index].imgStatus == "noimage"
                        ? "assets/images/p1.png"
                        : "https://hubbuddies.com/271059/gochat/images/user_profile/${editProfileController.userDetails[index].phoneNo!}.png",
                      height: screenHeight/9,
                    );
                  },
                );
              }),
            ),
            const SizedBox(height:5),
            Container(
              color: Colors.white,
              height: screenHeight/13,
              child: Obx(() {
                return ListView.builder(
                  itemCount: editProfileController.userDetails.length,
                  itemBuilder: (context, index) {
                    return EditProfileMenu(
                      title: "User Name",
                      text: editProfileController.userDetails[index].username,
                      press: (){
                        editProfileController.navigateEditUserNameVIew(editProfileController.userDetails[index].username!);
                      },
                      img: null,
                      height: screenHeight/13,
                    );
                  },
                );
              }),
            ),
            const SizedBox(height:5),
            Container(
              color: Colors.white,
              height: screenHeight/13,
              child: Obx(() {
                return ListView.builder(
                  itemCount: editProfileController.userDetails.length,
                  itemBuilder: (context, index) {
                    return EditProfileMenu(
                      title: "Phone",
                      text: editProfileController.userDetails[index].phoneNo,
                      press: (){
                        editProfileController.navigatePhoneNoNameVIew(editProfileController.userDetails[index].phoneNo!);
                      },
                      img: null,
                      height: screenHeight/13,
                    );
                  },
                );
              }),
            ),
            const SizedBox(height:5),
          ],
        ),
      ),
    );
  }
}