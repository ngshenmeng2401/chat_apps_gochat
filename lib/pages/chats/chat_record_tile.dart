import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/pages/chats/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRecordTile extends StatelessWidget {
  
  final chatController = Get.put(ChatsController());
  final ChatRecordModel chatsRecordModel;
  final int index;
  ChatRecordTile(this.index, this.chatsRecordModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal:20),
      child: Column(
        crossAxisAlignment: chatsRecordModel.username == "Shen Meng" ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: chatsRecordModel.username == "Shen Meng" 
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
            ),
            padding: const EdgeInsets.all(15),
            child: Text(chatsRecordModel.message!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                height: 1.3,
                color: Colors.black,
              )),
          ),
          const SizedBox(height: 5),
          Text(chatsRecordModel.time!),

        ],
      ),
      alignment: chatsRecordModel.username == "Shen Meng" ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}