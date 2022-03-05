import 'dart:convert';
import 'dart:io';

import 'package:chat_apps_gochat/model/comment_model.dart';
import 'package:chat_apps_gochat/model/like_model.dart';
import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/pages/discover/moments/like_tile.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/moment_remote_service.dart';
import 'package:chat_apps_gochat/services/post_remote_service.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MomentsController extends GetxController{

  static final appData = GetStorage();
  var momentList = <Moment>[].obs;
  var userDetails = <User>[].obs;
  var commentList = <Comment>[].obs;
  var likeList = <Like>[].obs;

  late TextEditingController commentController = TextEditingController();
  late TextEditingController contentController = TextEditingController();
  late String email;
  late String base64Image = "";

  var phoneNo = "".obs;
  var isLoading = true.obs;
  var statusMsj = "".obs;
  var optionList = [].obs;
  var commentBoxList = [].obs;
  var commentOptionList = [].obs;
  var isComment = false.obs;
  var isTyping = false.obs;
  var text = ''.obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  @override
  void onInit() {
    loadMomentList();
    loadUser();
    loadCommentList();
    loadLikeList();
    super.onInit();
  }

  void loadMomentList() async{

    email = appData.read("keepLogin")??'';

    
    var moment = await MomentRemoteServices.fetchMoment(email);
    if (moment != null) {
      momentList.clear();
      momentList.assignAll(moment);
      for(int i = 0; i < momentList.length; i++) {

        optionList.insert(i, false);
        commentBoxList.insert(i, false);
        // print(momentList[i].likes);
      }
    } else {
      statusMsj("No any post".tr);
    }
  }

  void loadCommentList() async{

    email = appData.read("keepLogin")??'';

    isLoading(true);
    var comment = await MomentRemoteServices.fetchComment(email);
    if (comment != null) {
      commentList.clear();
      commentList.assignAll(comment);

      for(int i = 0; i < commentList.length; i++){
        commentOptionList.insert(i, false);
      }
    } else {
      statusMsj("No any comment".tr);
    }
  }

  void loadLikeList() async{

    email = appData.read("keepLogin")??'';

    var like = await MomentRemoteServices.fetchLikes(email);
    if (like != null) {
      likeList.clear();
      likeList.assignAll(like);
      // print(likeList.length);
    } else {
      statusMsj("No any like".tr);
    }
  }

  Future<String> loadUser() async{

    email = appData.read("keepLogin")??'';

    var user = await UserRemoteServices.fetchUser(email);
    if (user != null) {
      userDetails.assignAll(user);
      phoneNo.value = userDetails[0].phoneNo!;
    } else {
      statusMsj("No_data".tr);
    }
    return phoneNo.value;
  }

  void loadAllList() {
    loadMomentList();
    loadCommentList();
    loadLikeList();
    loadUser();
  }

  void displayLikeComment(bool option, int index){
    
    option == false 
    ? optionList[index] = true
    : optionList[index] = false;
  }

  void displayCommentBox(bool comment, int index){
    
    if(comment == false){

      commentBoxList[index] = true;
      optionList[index] = false;

    }else{
      commentBoxList[index] = false;
    }
  }

  void displayCommentOption(bool commentOption, int index){

    commentOption == false
      ? commentOptionList[index] = true
      : commentOptionList[index] = false;
  }

  void closeCommentBox(int index){
    commentController.clear();
    commentBoxList[index] = false;
  }

  void checkTextField(){

    commentController.text.isEmpty
      ? isTyping.value = false
      : isTyping.value = true;
  }

  void toggleLikeButton(String action, String postId){

    email = appData.read("keepLogin")??'';

    action == "like"

    ? MomentRemoteServices.likePost(postId, email)

    : MomentRemoteServices.unlikePost(postId, email);

    Future.delayed(const Duration(milliseconds: 500), () {
      loadMomentList();
      loadLikeList();
    });
  }

  void sendCommentPost(String postId,int index){

    String comment = commentController.text.toString();
    email = appData.read("keepLogin")??'';

    MomentRemoteServices.addComment(postId, email, comment);

    commentController.clear();
    commentBoxList[index] = false;
    Future.delayed(const Duration(seconds: 1), () {
      loadCommentList();
    });
  }

  void deleteComment(String commentId,int index) {

    email = appData.read("keepLogin")??'';

    MomentRemoteServices.deleteComment(commentId, email);
    
    Future.delayed(const Duration(milliseconds: 500), () {
      loadCommentList();
    });
  }

  void deletePost(String postId, String imgStatus){

    email = appData.read("keepLogin")??'';

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        momentList.clear(),
        PostRemoteServices.deletePost(email, postId, imgStatus),
        Future.delayed(const Duration(milliseconds: 500), () {
          loadMomentList();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void displayLikeList(double screenHeight, double screenWidth, String postId){

    Get.defaultDialog(
      title: "Likes".tr,
      content: Column(
        children: [
          Container(
            width: screenWidth/1.6,
            height: screenHeight/3.5,
            child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  itemCount: likeList.length, 
                  itemBuilder: (BuildContext context, int index) {
                    return LikeTile(index, postId, likeList[index]);
                  },
                )
              
          ),
        ],
      ),
      textCancel: "Close".tr,
      onConfirm: null,
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  Future<void> getImage(ImageSource imageSource) async {

    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (pickedFile != null){

      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync() / 1024 /1024).toStringAsFixed(2) + " MB";

      final cropImageFile = await ImageCropper().cropImage(

        sourcePath: selectedImagePath.value,
        maxWidth: 512,
        maxHeight: 512,
        compressFormat: ImageCompressFormat.jpg,
        aspectRatioPresets: [
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original
        ]
      );

      // Crop
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value = ((File(cropImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + " MB";

      //Compress
      final dir = Directory.systemTemp;
      final targetPath = dir.absolute.path + "/temp.jpg";

      var compressedFile = await FlutterImageCompress.compressAndGetFile(

        cropImagePath.value,
        targetPath,
        quality: 90,
      );

      compressImagePath.value = compressedFile!.path;

      compressImageSize.value = ((File(compressImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2) + " MB";

      base64Image = base64Encode(compressedFile.readAsBytesSync());

    }else{

      Get.snackbar("Error", "No image selected",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void addPostWithPic(String base64Image){

    email = appData.read("keepLogin")??'';
    String content = contentController.text.toString();

    if(base64Image.isEmpty && content.isEmpty){

      Get.snackbar("Error", "Please write content and select a photo.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );

    }else if(base64Image.isEmpty){

      Get.snackbar("Error", "Please select a photo.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );

    }else if(content.isEmpty){
      
      Get.snackbar("Error", "Please write content.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );

    }else{

      momentList.clear();
      PostRemoteServices.addPost(email, base64Image, content, "withPic");
      Get.back();
      Future.delayed(const Duration(seconds: 1), () {
        loadMomentList();
      });
      
    }
  }

  void addPostWithoutPic(){

    email = appData.read("keepLogin")??'';
    String content = contentController.text.toString();

    if(content.isEmpty){
      
      Get.snackbar("Error", "Please write content.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );

    }else{

      momentList.clear();
      PostRemoteServices.addPost(email, "a", content, "withoutPic");
      Get.back();
      Future.delayed(const Duration(seconds: 1), () {
        loadMomentList();
      });
      // loadPost();
    }
  }

  copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  pasteText() async {
    ClipboardData? clipborad = await Clipboard.getData('text/plain');
    text.value = clipborad!.text!;
    commentController.text = text.value;
  }

  void navigatePostWithPic(){
    Get.toNamed(AppRoutes.MomentWithPicPage)!.then((value) => loadMomentList());
  }

  void navigatePostWithoutPic(){
    Get.toNamed(AppRoutes.MomentWithoutPicPage)!.then((value) => loadMomentList());
  }
}