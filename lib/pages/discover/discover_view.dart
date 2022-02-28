import 'package:chat_apps_gochat/pages/discover/discover_controller.dart';
import 'package:chat_apps_gochat/pages/discover/discover_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverView extends StatelessWidget {
  DiscoverView({ Key? key }) : super(key: key);

  final discoverController = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover".tr),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              DiscoverMenu(
                icon: const Icon(
                  Icons.mode_comment, 
                  size: 30,
                  color: Colors.greenAccent),
                text: "Moment",
                press: (){
                  discoverController.navigateMomentPage();
                },
              ),
              const SizedBox(height:5),
              const DiscoverMenu(
                icon: Icon(
                  Icons.scanner_outlined, 
                  size: 30,
                  color: Colors.blueAccent),
                text: "Scan",
                press: null,
              ),
              const DiscoverMenu(
                icon: Icon(
                  Icons.phone, 
                  size: 30,
                  color: Colors.blueAccent),
                text: "Shake",
                press: null,
              ),
              const SizedBox(height:5),
              const DiscoverMenu(
                icon: Icon(
                  Icons.payment, 
                  size: 30,
                  color: Colors.orangeAccent),
                text: "Top Stories",
                press: null,
              ),
              const DiscoverMenu(
                icon: Icon(
                  Icons.search_outlined, 
                  size: 30,
                  color: Colors.redAccent),
                text: "Search",
                press: null,
              ),
              const SizedBox(height:5),
              const DiscoverMenu(
                icon: Icon(
                  Icons.nature_people_outlined, 
                  size: 30,
                  color: Colors.blueAccent),
                text: "People Nearby",
                press: null,
              ),
              const SizedBox(height:5),
              const DiscoverMenu(
                icon: Icon(
                  Icons.local_activity_outlined, 
                  size: 30,
                  color: Colors.purpleAccent),
                text: "Mini Programs",
                press: null,
              ),
              const SizedBox(height:5),
              const DiscoverMenu(
                icon: Icon(
                  Icons.call, 
                  size: 30,
                  color: Colors.greenAccent),
                text: "WeChat Out",
                press: null,
              ),
            ],
          )
        ),
      ),
    );
  }
}