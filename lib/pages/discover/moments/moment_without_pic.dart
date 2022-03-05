import 'package:chat_apps_gochat/pages/discover/moments/moment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MomentWithoutPicView extends StatelessWidget {
  MomentWithoutPicView({ Key? key }) : super(key: key);

  final momentsController = Get.put(MomentsController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Discard Your Changes'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                },
                child: const Text('Exit',
                  style: TextStyle(
                    color: Colors.red,
                  ),)
              ),
            ],
          ));
        return willLeave;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post Text"),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: screenWidth/7,
                height: screenHeight/15,
                color: Colors.blue,
                onPressed: (){
                  momentsController.addPostWithoutPic();
                }, 
                child: const Text("Post",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),)
              ),
            )
          ],    
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: TextField(
                  enableInteractiveSelection: true,
                  keyboardType: TextInputType.emailAddress,
                  controller: momentsController.contentController,
                  decoration: InputDecoration(
                    hintText: "Say something...".tr,
                  ),
                ),),
            ],
          ),
        ),
      ),
      
    );
  }
}