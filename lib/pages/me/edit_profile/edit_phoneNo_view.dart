import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhoneNoView extends StatelessWidget {

  final editProfileController = Get.put(EditProfileController());
  final String phone;
  EditPhoneNoView(this.phone, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Phone No".tr),
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
                editProfileController.editPhoneNo(phone);
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
                keyboardType: TextInputType.emailAddress,
                controller: editProfileController.phoneNoController,
                decoration: InputDecoration(
                  hintText: phone.tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}