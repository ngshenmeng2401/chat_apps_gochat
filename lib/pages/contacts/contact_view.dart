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
        title: Text("Contacts".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContactMenu(
              icon: Icon(Icons.person_add_alt_1,
                size: 30,),
              text: "New Friends",
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
            const ContactMenu(
              icon: Icon(Icons.verified,
                size: 30,),
              text: "Official Accounts",
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