import 'package:chat_apps_gochat/model/post_model.dart';
import 'package:chat_apps_gochat/pages/me/my_post/my_post_details.dart';
import 'package:get/get.dart';

class MyPostController extends GetxController{

  final postModel = <PostModal>[

    PostModal(
      postId: 1,
      email: "meng@gmail.com",
      content: "My first movie",
      dateTime: DateTime.now(),
      imgStatus: "yes",
      img: "assets/images/p1.png",
    ),
    PostModal(
      postId: 2,
      email: "meng@gmail.com",
      content: "Weekend jogging",
      dateTime: DateTime.now(),
      imgStatus: "yes",
      img: "assets/images/p1.png",
    ),
    PostModal(
      postId: 3,
      email: "meng@gmail.com",
      content: "Haiyah, 没钱了...",
      dateTime: DateTime.now(),
      imgStatus: "noimage",
      img: "assets/images/p1.png",
    ),
    PostModal(
      postId: 4,
      email: "meng@gmail.com",
      content: "Basketball",
      dateTime: DateTime.now(),
      imgStatus: "yes",
      img: "assets/images/p1.png",
    ),
    PostModal(
      postId: 5,
      email: "meng@gmail.com",
      content: "831 831 831",
      dateTime: DateTime.now(),
      imgStatus: "noimage",
      img: "assets/images/p1.png",
    ),
  ];

  void navigatePostDetails(PostModal postModel) {

    Get.to(() => MyPostDetailsView(postModel));
  }
}