import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MomentsView extends StatelessWidget {
  MomentsView({ Key? key }) : super(key: key);

  final momentsController = Get.put(MomentsController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int index = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Moments"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              LimitedBox(
                child: Obx(() {
                  return ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: momentsController.momentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MomentTile(index,momentsController.momentList[index], momentsController.isComment.value);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}