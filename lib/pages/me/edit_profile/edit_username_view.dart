import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUsernameView extends StatelessWidget {

  final editProfileController = Get.put(EditProfileController());
  final String userName;
  EditUsernameView(this.userName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit UserName".tr),
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
                editProfileController.editUserName("0");
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                enableInteractiveSelection: true,
                keyboardType: TextInputType.emailAddress,
                controller: editProfileController.userNameController,
                decoration: InputDecoration(
                  hintText: userName.tr,
                ),
              ),
              const SizedBox( height: 10),
              const Text("Pick a name friends will remember.",
                style: TextStyle(
                  fontSize: 14
                ),)
            ],
          ),
        ),
      ),
    );
  }
}