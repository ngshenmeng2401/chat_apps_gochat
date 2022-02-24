import 'package:chat_apps_gochat/pages/me/my_post/my_post_controller.dart';
import 'package:chat_apps_gochat/pages/me/my_post/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPostView extends StatelessWidget {
  MyPostView({ Key? key }) : super(key: key);

  final myPostController = Get.put(MyPostController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight/1.1,
              child: ListView.builder(
                itemCount: myPostController.postModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostTile(index, myPostController.postModel[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}