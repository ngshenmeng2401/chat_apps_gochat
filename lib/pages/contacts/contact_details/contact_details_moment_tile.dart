import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_details/contact_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactMomentTile extends StatelessWidget {
  
  final contactDetailController = Get.put(ContactDetailController());
  final Moment moment;
  ContactMomentTile(this.moment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Image.network("https://javathree99.com/s271059/gochat/images/post/${moment.postId}.png",
          fit: BoxFit.fill,),
      ),
    );
  }
}