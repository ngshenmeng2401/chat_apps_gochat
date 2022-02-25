import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friend_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewFriendsTile extends StatelessWidget {

  final newFriendController = Get.put(NewFriendController());
  final Contacts contacts;
  NewFriendsTile(this.contacts, {Key? key}) : super(key: key);

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
                  child: contacts.imgStatus == "noimage"
                    ? Image.asset("assets/images/p1.png",
                        fit: BoxFit.fitWidth,)
                    : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${contacts.phoneNo}.png")
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contacts.username!,
                          style: const TextStyle(
                            fontSize: 18
                          ),),
                        const SizedBox(height: 5),
                        Text(contacts.phoneNo!,),
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
                    onPressed: (){
                      newFriendController.navigateAddUserView(contacts);
                    },
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