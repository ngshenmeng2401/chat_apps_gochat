import 'package:chat_apps_gochat/model/comment_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentTile extends StatelessWidget {

  final momentsController = Get.put(MomentsController());
  final int index;
  final Comment comment;
  final String postId;
  final widgetKey = GlobalKey();
  CommentTile(this.index, this.comment, this.postId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      key: widgetKey,
      onLongPress: (){
        showMenu(
          context: context, 
          position: _getRelativeRect(widgetKey),
          items: comment.writerEmail == momentsController.email
            ? <PopupMenuEntry> [
              PopupMenuItem(
                onTap: (){
                  momentsController.copyText(comment.commentText!);
                },
                value: 1, 
                child: const Text('Copy'),),
              PopupMenuItem(
                onTap: (){
                  momentsController.deleteComment(comment.commentId!, index);
                },
                child: const Text('Delete'),)
            ]
            : <PopupMenuEntry> [
              PopupMenuItem(
                onTap: (){
                  momentsController.copyText(comment.commentText!);
                },
                value: 1, 
                child: const Text('Copy'),),
            ]
        );
      },
      child: postId == comment.postId
      ? Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          height: 25,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("${comment.username}: "),
                  Text("${comment.commentText}"),
                ],
              ),
            ],
          ),
        )
      : Container(),
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