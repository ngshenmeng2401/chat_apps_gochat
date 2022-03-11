import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:chat_apps_gochat/pages/chatroom/chat/chat_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRecordTile extends StatelessWidget {
  
  final chatRecordController = Get.put(ChatRecordController());
   final Chat chat;
  final int index;
  final widgetKey = GlobalKey();
  ChatRecordTile(this.index, this.chat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String dateSent = DateFormat('yyyy-MM-dd HH:mm:ss').format(chat.dateSent!);

    return GestureDetector(
      key: widgetKey,
      onLongPress: (){
        showMenu(
          context: context, 
          position: _getRelativeRect(widgetKey),
          items: chat.phoneNo == chatRecordController.phoneNo.value
            ? <PopupMenuEntry> [
              PopupMenuItem(
                onTap: (){
                  chatRecordController.copyText(chat.message!);
                },
                value: 1, 
                child: const Text('Copy'),),
              PopupMenuItem(
                onTap: (){
                },
                child: const Text('Delete'),)
            ]
            : <PopupMenuEntry> [
              PopupMenuItem(
                onTap: (){
                  chatRecordController.copyText(chat.message!);
                },
                value: 1, 
                child: const Text('Copy'),),
            ]
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal:20),
        child: Column(
          crossAxisAlignment: chat.phoneNo == chatRecordController.phoneNo.value ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: chat.phoneNo == chatRecordController.phoneNo.value
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
              child: Text(chat.message!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  color: Colors.black,
                )),
            ),
            const SizedBox(height: 5),
            Text(dateSent),
    
          ],
        ),
        alignment: chat.phoneNo == chatRecordController.phoneNo.value ? Alignment.centerRight : Alignment.centerLeft,
      ),
    );
  }

  RelativeRect _getRelativeRect(GlobalKey key){
  return RelativeRect.fromSize(
      _getWidgetGlobalRect(key), const Size(200, 200));
  }

  Rect _getWidgetGlobalRect(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);
    debugPrint('Widget position: ${offset.dx} ${offset.dy}');
    return Rect.fromLTWH(offset.dx / 3.1, offset.dy * 1.05,
        renderBox.size.width, renderBox.size.height);
  }
}