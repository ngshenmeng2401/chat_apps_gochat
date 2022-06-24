import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/pages/chatroom/chat/chat_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendTile extends StatelessWidget {

  final chatRecordController = Get.put(ChatRecordController());
  final Friend friend;
  final int index;
  FriendTile(this.index, this.friend, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(

      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
      child: GestureDetector(
        onTap: (){
          
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: 
                  friend.imgStatus == "noimage"
                  ? 
                  Image.asset("assets/images/p1.png",
                    height: screenHeight/20,
                    fit: BoxFit.contain,)
                  : Image.network("https://hubbuddies.com/s271059/gochat/images/user_profile/${friend.phoneNo}.png",
                    height: screenHeight/20,),
                ),
              ),
              // const SizedBox(width: 20),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(friend.username!,
                    overflow: TextOverflow.ellipsis,),
                ),
              ),
              Expanded(
                flex: 2,
                child: Icon(Icons.chat_bubble,
                  color: Colors.orange[300],),
              ),
            ],
          ),
      ),
    );
  }
}