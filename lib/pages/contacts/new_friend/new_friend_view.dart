import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friend_controller.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friends_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFriendView extends StatelessWidget {
  NewFriendView({ Key? key }) : super(key: key);

  final newFriendController = Get.put(NewFriendController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
              Obx(() => newFriendController.isTyping.value == true
                    ? InkWell(
                        onTap: (){
                          newFriendController.searchUser();
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          height: screenHeight/12,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Icon(Icons.people)
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text("Click here to search user",
                                        style:  TextStyle(
                                          fontSize: 18
                                        ),),
                                    ],
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      )
                      : Container()
              ),
              Container(
              height: screenHeight/1.1,
                child: Obx(() {
                  if (newFriendController.isLoading.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            newFriendController.statusMsj.toString().tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  } else if (newFriendController.contactList.isEmpty) {
                    return Center(
                      child: Text(
                      newFriendController.statusMsj.toString(),
                      style: const TextStyle(fontSize: 20),
                    ));
                  } else {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ListView.builder(
                      itemCount: newFriendController.contactList.length, 
                      itemBuilder: (context, index) {
                        return NewFriendsTile(newFriendController.contactList[index]);
                      }, )
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}