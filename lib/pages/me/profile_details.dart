import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/pages/me/me_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileDetails extends StatelessWidget {

  final profileController = Get.put(ProfileController());
  final appData = GetStorage();
  final User user;
  ProfileDetails(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String? email = appData.read("email")??'';

    return InkWell(
      onTap: (){
        profileController.navigateMyProfilePage();
      },
      child: Container(
        height: screenHeight/6,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: user.imgStatus == "noimage"
                  ? Image.asset("assets/images/p1.png",
                      fit: BoxFit.fitWidth,)
                  : Image.network("https://javathree99.com/s271059/gochat/images/user_profile/${user.phoneNo}.png",
                      fit: BoxFit.fitWidth,)
              )
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        child: Text("${user.username}",
                          style: const TextStyle(
                            fontSize: 26
                          ),),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        child: Text("Email: " + email,
                          style: const TextStyle(
                            fontSize: 17
                          ),),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(Icons.arrow_forward_ios,
                size: 20,),
            ),
          ],
        ),
      ),
    );
  }
}