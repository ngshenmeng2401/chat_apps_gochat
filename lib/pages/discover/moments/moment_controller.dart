import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:get/get.dart';

class MomentsController extends GetxController{

  final moments = <MomentModal>[

    MomentModal(
      id: "1",
      email: "meng@gmail.com",
      content: "hihi",
      imgStatus: "noimage",
    ),
    MomentModal(
      id: "2",
      email: "meng@gmail.com",
      content: "nice angle",
      imgStatus: "yes",
    ),
    MomentModal(
      id: "1",
      email: "jimmytan@gmail.com",
      content: "Hi Everybody !!!",
      imgStatus: "noimage",
    ),
    MomentModal(
      id: "1",
      email: "jimmytan@gmail.com",
      content: "New sofa !!!!",
      imgStatus: "yes",
    ),
  ];

  var isOption = false.obs;

  void displayLikeComment(bool option){

    option == false 
    ? isOption.value = true
    : isOption.value = false;
  }
}