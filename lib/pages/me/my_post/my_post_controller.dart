import 'dart:convert';
import 'dart:io';

import 'package:chat_apps_gochat/model/my_post_model.dart';
import 'package:chat_apps_gochat/pages/me/my_post/my_post_details.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/post_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class MyPostController extends GetxController{

  final appData = GetStorage();
  late TextEditingController contentController = TextEditingController();
  late String email;
  late String base64Image = "";

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  var postList = <MyPost>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadPost();
    super.onInit();
  }

  void loadPost() async{

    email = appData.read("keepLogin")??'';

    try {
      isLoading(true);
      var post = await PostRemoteServices.fetchPost(email);
      if (post != null) {
        postList.assignAll(post);
        // print(postList);
      } else {
        // productList = null;
        statusMsj("No any post".tr);
      }
    } finally {
      isLoading(false);
    }
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

      postList.clear();
      PostRemoteServices.addPost(email, base64Image, content, "withPic");
      Get.back();
      Future.delayed(const Duration(seconds: 2), () {
        loadPost();
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

      postList.clear();
      PostRemoteServices.addPost(email, "a", content, "withoutPic");
      Get.back();
      Future.delayed(const Duration(seconds: 2), () {
        loadPost();
      });
      // loadPost();
    }
  }

  void deletePostDialog(String postId, String imgStatus) {

    email = appData.read("keepLogin")??'';

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        postList.clear(),
        PostRemoteServices.deletePost(email, postId, imgStatus),
        Get.back(),
        Future.delayed(const Duration(seconds: 2), () {
          loadPost();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigatePostWithPic(){
    Get.toNamed(AppRoutes.PostWithPicPage)!.then((value) => loadPost());
  }

  void navigatePostWithoutPic(){
    Get.toNamed(AppRoutes.PostWithoutPicPage)!.then((value) => loadPost());
  }

  void navigatePostDetails(MyPost post) {

    Get.to(() => MyPostDetailsView(post));
  }
}