import 'package:chat_apps_gochat/pages/me/me_controller.dart';
import 'package:chat_apps_gochat/pages/me/profile_details.dart';
import 'package:chat_apps_gochat/pages/me/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeView extends StatelessWidget {

  final profileController = Get.put(ProfileController());

  MeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Me".tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                height: screenHeight/6,
                child: Obx(() {
                  if (profileController.isLoading.value) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red[200],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            profileController.statusMsj.toString().tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  } else if (profileController.userDetails.isEmpty) {
                    return Center(
                      child: Text(
                      profileController.statusMsj.toString(),
                      style: const TextStyle(fontSize: 20),
                    ));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ListView.builder(
                        itemCount: profileController.userDetails.length,
                        itemBuilder: (context, index) {
                          return ProfileDetails(profileController.userDetails[index]);
                        },
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(height:5),
              const ProfileMenu(
                icon: Icon(
                  Icons.payment, 
                  size: 30,
                  color: Colors.greenAccent),
                text: "Pay",
                press: null,
              ),
              const SizedBox(height:5),
              const ProfileMenu(
                icon: Icon(
                  Icons.favorite, 
                  size: 30,
                  color: Colors.redAccent,),
                text: "Favourite",
                press: null,
              ),
              const ProfileMenu(
                icon: Icon(
                  Icons.image_outlined, 
                  size: 30,
                  color: Colors.indigoAccent,),
                text: "My Posts",
                press: null,
              ),
              const ProfileMenu(
                icon: Icon(
                  Icons.card_travel_outlined,
                  size: 30,
                  color: Colors.blueAccent,),
                text: "Cards & Offers",
                press: null,
              ),
              const ProfileMenu(
                icon: Icon(
                  Icons.emoji_emotions_outlined, 
                  size: 30,
                  color: Colors.orangeAccent,),
                text: "Sticker Gallery",
                press: null,
              ),
              const SizedBox(height:5),
              const ProfileMenu(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.blueGrey,),
                text: "Settings",
                press: null,
              ),
              const SizedBox(height:5),
              ProfileMenu(
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: Colors.redAccent,),
                text: "Logout",
                press: (){
                  profileController.logOut();
                },
                hasNavigation: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}