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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           LimitedBox(
              child: ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: newRequestController.requestModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewRequestTile(newRequestController.requestModel[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}