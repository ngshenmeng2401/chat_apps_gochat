import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friend_controller.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friends_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFriendView extends StatelessWidget {
  NewFriendView({ Key? key }) : super(key: key);

  final newFriendController = Get.put(NewFriendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => newFriendController.isSearching.value == false
          ? Text("New Friends".tr)
          : TextField(
              keyboardType: TextInputType.phone,
              controller: newFriendController.searchPhoneController,
              decoration: InputDecoration(
                labelText: "Key in phone no...".tr,
                labelStyle: const TextStyle(color: Colors.white70),
              ),
              onChanged: (value) {
                newFriendController.checkTextField();
              },
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
        ),
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              newFriendController.clearTextField();
            },
            icon: newFriendController.isTyping.value == true
                ? const Icon(Icons.clear)
                : const Icon(
                    Icons.clear,
                    color: Colors.transparent,),
          )),
          IconButton(
            onPressed: (){
              newFriendController.isSearchingContact(newFriendController.isSearching.value);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LimitedBox(
                child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemCount: newFriendController.contactsModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NewFriendsTile(index, newFriendController.contactsModel[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}