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
        actions: [
          IconButton(
            onPressed: (){
              myPostController.navigatePostWithPic();
            }, 
            icon: const Icon(Icons.camera_alt)),
          IconButton(
            onPressed: (){
              myPostController.navigatePostWithoutPic();
            }, 
            icon: const Icon(Icons.text_fields)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight/1.1,
              child: Obx(() {
                if (myPostController.isLoading.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          myPostController.statusMsj.toString().tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                } else if (myPostController.postList.isEmpty) {
                  return Center(
                    child: Text(
                    myPostController.statusMsj.toString(),
                    style: const TextStyle(fontSize: 20),
                  ));
                } else {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ListView.builder(
                    itemCount: myPostController.postList.length, 
                    itemBuilder: (context, index) {
                      return PostTile(index, myPostController.postList[index]);
                    }, )
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}