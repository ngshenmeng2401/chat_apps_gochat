import 'package:chat_apps_gochat/model/chat_model.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController{

  final chatModel = <ChatsModel>[

    ChatsModel(
      username: "Weng Kee",
      img: "assets/images/p1.png",
      chat: "晚安",
      time: "12:26 am",
      mute: false,
    ),
    ChatsModel(
      username: "Jimmy Tan",
      img: "assets/images/p2.jpg",
      chat: "ok",
      time: "2:15 pm",
      mute: false,
    ),
    ChatsModel(
      username: "Jia Earn",
      img: "assets/images/p3.jpg",
      chat: "yaya",
      time: "3:56 pm",
      mute: false,
    ),
    ChatsModel(
      username: "Suan Ming",
      img: "assets/images/p4.jpg",
      chat: "我直接等jimmy排了",
      time: "4:49 pm",
      mute: false,
    ),
    ChatsModel(
      username: "Star Goh",
      img: "assets/images/p5.jpg",
      chat: "Haiyah",
      time: "10:26 pm",
      mute: false,
    ),
    ChatsModel(
      username: "Qian Yi",
      img: "assets/images/p1.png",
      chat: "吃鸡咯",
      time: "11:39 pm",
      mute: false,
    ),
    ChatsModel(
      username: "Mingger",
      img: "assets/images/p2.jpg",
      chat: "okok",
      time: "9:41 pm",
      mute: false,
    ),
  ];
}