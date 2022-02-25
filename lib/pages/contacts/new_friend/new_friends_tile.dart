import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFriendsTile extends StatelessWidget {

  final newFriendController = Get.put(NewFriendController());
  final ContactsModal contactsModal;
  final int index;
  NewFriendsTile(this.index, this.contactsModal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: (){},
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: screenHeight/12,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset("${newFriendController.contactsModel[index].img}",
                  height: screenHeight/2,
                  width: screenWidth/1.3,
                  fit: BoxFit.fitWidth,)
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(newFriendController.contactsModel[index].username!,
                          style: const TextStyle(
                            fontSize: 18
                          ),),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.blue,
                    onPressed: (){},
                    child: const Text("Add",
                      style: TextStyle(color: Colors.white)),
                  )
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}