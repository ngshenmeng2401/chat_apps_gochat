import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/new_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestUserDetails extends StatelessWidget {

  final newRequestController = Get.put(NewRequestController());
  final RequestModal requestModel;
  RequestUserDetails(this.requestModel, {Key? key}) : super(key: key);

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
                        // user.imgStatus == "noimage"
                        //   ? 
                          Image.asset("assets/images/p1.png",
                              fit: BoxFit.fitWidth,)
                          // : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${user.phoneNo}.png",
                          //     fit: BoxFit.fitWidth,)
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
                                child: Text(requestModel.friendEmail!,
                                  style: const TextStyle(
                                    fontSize: 22
                                  ),),
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                                child: const Text("Email: ",
                                  style:  TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}