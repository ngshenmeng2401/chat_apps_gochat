import 'package:chat_apps_gochat/model/friend_request_modal.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/new_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRequestTile extends StatelessWidget {

  final newRequestController = Get.put(NewRequestController());
  final FriendRequest friendRequest;
  NewRequestTile(this.friendRequest, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: (){
            newRequestController.navigateRequestUserDetails(friendRequest);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: screenHeight/12,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: friendRequest.imgStatus == "noimage" 
                          ? Image.asset("assets/images/p1.png",
                              fit: BoxFit.fitWidth,)
                          : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${friendRequest.phoneNo}.png"),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friendRequest.username!,
                          style: const TextStyle(
                            fontSize: 18
                          ),),
                        const SizedBox(height: 5),
                        Text(friendRequest.requestMessage!,
                          overflow: TextOverflow.ellipsis,),
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
                      newRequestController.acceptRequestDialog(friendRequest.email!, friendRequest.friendEmail!);
                    },
                    child: const Text("Accept",
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