import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/pages/contacts/contacts_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailsView extends StatelessWidget {

  final contactsController = Get.put(ContactsController());
  final Friend friend;
  ContactDetailsView(this.friend, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("".tr)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: screenHeight/6,
              // color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: 
                        friend.imgStatus == "noimage"
                        ? Image.asset("assets/images/p1.png",
                            fit: BoxFit.fitWidth,)
                        : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${friend.phoneNo}.png",
                            fit: BoxFit.fitWidth,)
                    )
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(),
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              child: Text(friend.username!,
                                style: const TextStyle(
                                  fontSize: 22
                                ),),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Container(
                              child:  Text("Email: ${friend.friendEmail}",
                                style: const  TextStyle(
                                  fontSize: 17
                                ),),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 15,),
            Container(
              // color: Colors.amberAccent,
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: screenHeight/10,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Text("Moments",
                        style: TextStyle(fontSize: 18),)
                    )
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return const Card(
                            child: Center(child: Text("Test a card")),
                          );
                        },)
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(Icons.arrow_forward_ios,
                      size: 20,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                color: Colors.grey[100],
                height: screenHeight/12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.conversation_bubble),
                    SizedBox(width: 10),
                    Text("Send message",
                      style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}