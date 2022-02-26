import 'package:chat_apps_gochat/pages/contacts/new_request/new_request_controller.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/new_request_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRequestView extends StatelessWidget {
  NewRequestView({ Key? key }) : super(key: key);

  final newRequestController = Get.put(NewRequestController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("New Request".tr)
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              // color: Colors.amberAccent,
              height: screenHeight/1.1,
              child: Obx(() {
                if (newRequestController.isLoading.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          newRequestController.statusMsj.toString().tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                } else if (newRequestController.requestList.isEmpty) {
                  return Center(
                    child: Text(
                    newRequestController.statusMsj.toString(),
                    style: const TextStyle(fontSize: 20),
                  ));
                } else {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ListView.builder(
                    itemCount: newRequestController.requestList.length, 
                    itemBuilder: (context, index) {
                      return NewRequestTile(newRequestController.requestList[index]);
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