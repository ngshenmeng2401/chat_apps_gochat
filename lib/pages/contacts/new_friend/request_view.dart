import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestView extends StatelessWidget {
  
  final appData = GetStorage();
  final newFriendController = Get.put(NewFriendController());
  final Contacts contacts;
  RequestView(this.contacts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String? email = appData.read("email")??'';

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minWidth: screenWidth/7,
              height: screenHeight/15,
              color: Colors.blue,
              onPressed: (){
                newFriendController.sendFriendRequest(contacts.email!);
              }, 
              child: const Text("Send",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),)
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children:  [
              Text("Send Friend Request".tr,
                style: const TextStyle(
                  fontSize: 24,
                ),),
              const SizedBox(height: 10),
              Container(
                width: screenWidth/1.2,
                child: TextField(
                    enableInteractiveSelection: true,
                    keyboardType: TextInputType.phone,
                    controller: newFriendController.requestController,
                    decoration: InputDecoration(
                      labelText: "Send Friend Request".tr,
                      // labelStyle: const TextStyle(color: Colors.white70),
                    ),
                    // style: const TextStyle(color: Colors.white),
                    // cursorColor: Colors.white,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}