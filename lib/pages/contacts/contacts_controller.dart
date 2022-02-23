import 'package:chat_apps_gochat/model/contacts_model.dart';
import 'package:get/state_manager.dart';

class ContactsController extends GetxController{

  final contactsModel = <ContactsModal>[

    ContactsModal(
      username: "Weng Kee",
      img: "assets/images/p1.png",
    ),
    ContactsModal(
      username: "Jimmy Tan",
      img: "assets/images/p2.jpg",
    ),
    ContactsModal(
      username: "Jia Earn",
      img: "assets/images/p3.jpg",
    ),
    ContactsModal(
      username: "Suan Ming",
      img: "assets/images/p4.jpg",
    ),
    ContactsModal(
      username: "Star Goh",
      img: "assets/images/p5.jpg",
    ),
    ContactsModal(
      username: "Qian Yi",
      img: "assets/images/p1.png",
    ),
    ContactsModal(
      username: "Mingger",
      img: "assets/images/p2.jpg",
    ),
  ];
}