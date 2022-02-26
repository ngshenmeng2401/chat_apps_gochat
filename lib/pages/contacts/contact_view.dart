import 'package:badges/badges.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_menu.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_tile.dart';
import 'package:chat_apps_gochat/pages/contacts/contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsView extends StatelessWidget {
   ContactsView({ Key? key }) : super(key: key);

  final contactsController = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => contactsController.isSearching.value == false
          ? Text("Contacts".tr)
          : TextField(
              keyboardType: TextInputType.phone,
              controller: contactsController.searchPhoneController,
              decoration: InputDecoration(
                labelText: "Key in phone no...".tr,
                labelStyle: const TextStyle(color: Colors.white70),
              ),
              onChanged: (value) {
                contactsController.checkTextField();
              },
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
        ),
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              contactsController.clearTextField();
            },
            icon: contactsController.isTyping.value == true
                ? const Icon(Icons.clear)
                : const Icon(
                    Icons.clear,
                    color: Colors.transparent,),
          )),
          IconButton(
            onPressed: (){
              contactsController.isSearchingContact(contactsController.isSearching.value);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContactMenu(
              icon: const Icon(Icons.person_add_alt_1,
                size: 30,),
              text: "New Friends",
              press: (){
                contactsController.navigateNewFriendsPage();
              },
            ),
            Badge(
              showBadge: contactsController.requestList.length > 0 ? true : false,
              badgeColor: Colors.blue[300]!,
              badgeContent: Text(contactsController.requestList.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),),
              position: BadgePosition.topEnd(
                top: 5,
                end: 20,
              ),
              child: ContactMenu(
                icon: const Icon(Icons.request_page,
                  size: 30,),
                text: "New Requests",
                press: (){
                  contactsController.navigateNewRequestsPage();
                },
              ),
            ),
            const ContactMenu(
              icon: Icon(Icons.people,
                size: 30,),
              text: "Group Chats",
            ),
            const ContactMenu(
              icon: Icon(Icons.local_offer_outlined,
                size: 30,),
              text: "Tags",
            ),
            const SizedBox(
              height: 20,
            ),
            LimitedBox(
              child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: contactsController.contactsModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ContactsTile(index, contactsController.contactsModel[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}