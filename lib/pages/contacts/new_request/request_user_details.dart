import 'package:chat_apps_gochat/model/friend_request_model.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/new_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestUserDetails extends StatelessWidget {

  final newRequestController = Get.put(NewRequestController());
  final FriendRequest friendRequest;
  RequestUserDetails(this.friendRequest, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("".tr)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                height: screenHeight/6,
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: 
                          friendRequest.imgStatus == "noimage"
                          ? Image.asset("assets/images/p1.png",
                              fit: BoxFit.fitWidth,)
                          : Image.network("https://hubbuddies.com/271059/gochat/images/user_profile/${friendRequest.phoneNo}.png",
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
                                child: Text(friendRequest.username!,
                                  style: const TextStyle(
                                    fontSize: 22
                                  ),),
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                                child:  Text("Email: ${friendRequest.email}",
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
              const Text("Request Message: ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),),
              const SizedBox(height: 15,),
              Container(
                height: screenHeight/8,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.fromLTRB(15, 10, 15 ,10),
                width: screenWidth/1.1,
                child: Text(friendRequest.requestMessage!,
                  textAlign: TextAlign.justify,
                  maxLines: 4,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  )),
              ),
              const SizedBox(height: 15,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: screenWidth / 1.1,
                height: screenHeight / 18,
                color: Colors.black,
                onPressed: () {
                  newRequestController.acceptRequestDialog(friendRequest.email!, friendRequest.friendEmail!);
                },
                child: Text("Accept".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}