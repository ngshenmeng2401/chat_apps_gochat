import 'package:chat_apps_gochat/pages/discover/discover_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({ Key? key }) : super(key: key);

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
            children: const [
              DiscoverMenu(
                icon: Icon(
                  Icons.mode_comment, 
                  size: 30,
                  color: Colors.greenAccent),
                text: "Moment",
                press: null,
              ),
              SizedBox(height:5),
              DiscoverMenu(
                icon: Icon(
                  Icons.scanner_outlined, 
                  size: 30,
                  color: Colors.blueAccent),
                text: "Scan",
                press: null,
              ),
              DiscoverMenu(
                icon: Icon(
                  Icons.phone, 
                  size: 30,
                  color: Colors.blueAccent),
                text: "Shake",
                press: null,
              ),
              SizedBox(height:5),
              DiscoverMenu(
                icon: Icon(
                  Icons.payment, 
                  size: 30,
                  color: Colors.orangeAccent),
                text: "Top Stories",
                press: null,
              ),
              DiscoverMenu(
                icon: Icon(
                  Icons.search_outlined, 
                  size: 30,
                  color: Colors.redAccent),
                text: "Search",
                press: null,
              ),
              SizedBox(height:5),
              DiscoverMenu(
                icon: Icon(
                  Icons.nature_people_outlined, 
                  size: 30,
                  color: Colors.blueAccent),
                text: "People Nearby",
                press: null,
              ),
              SizedBox(height:5),
              DiscoverMenu(
                icon: Icon(
                  Icons.local_activity_outlined, 
                  size: 30,
                  color: Colors.purpleAccent),
                text: "Mini Programs",
                press: null,
              ),
              SizedBox(height:5),
              DiscoverMenu(
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