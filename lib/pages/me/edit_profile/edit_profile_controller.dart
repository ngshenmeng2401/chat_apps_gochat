import 'dart:convert';
import 'dart:io';
import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/edit_phoneNo_view.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_pic_view.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/edit_username_view.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class EditProfileController extends GetxController{

  final appData = GetStorage();
  String? email;

  late TextEditingController userNameController = TextEditingController();
  late TextEditingController phoneNoController = TextEditingController();

  var userDetails = <User>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  // Crop code
  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  late File image;

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser() async{

    email = appData.read("email")??'';

    var user = await UserRemoteServices.fetchUser(email!);
    userDetails.assignAll(user!);
    
  }

  Future<void> getImage(ImageSource imageSource, String phoneNo) async {

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
          CropAspectRatioPreset.square
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

      print('Ori path: ' + compressedFile.path);

      String d = path.dirname(compressedFile.path);
      String newPath = path.join(d, phoneNo+'.jpg');
      print("New path: " + newPath);

      String base64Image = base64Encode(compressedFile.readAsBytesSync());
      email = appData.read("email")??'';
      UserRemoteServices.editProfilePic(email, base64Image, phoneNo);
      // print("picture: " + base64Image);

    }else{

      Get.snackbar("Error", "No image selected",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void editUserName(String oldPhoneNo){

    String? username = userNameController.text.toString();
    String? phoneNo = phoneNoController.text.toString();
    email = appData.read("email")??'';

    if(username.isEmpty){
       Get.snackbar(
        "Error","Username is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else{
      phoneNo ="";
      UserRemoteServices.editUser(email, username, phoneNo, oldPhoneNo);
      loadUser();
    }
  }

  void editPhoneNo(String oldPhoneNo) {

    String? username = userNameController.text.toString();
    String? phoneNo = phoneNoController.text.toString();
    email = appData.read("email")??'';

    if(phoneNo.isEmpty){
       Get.snackbar(
        "Error","Phone No is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else{
      username ="";
      UserRemoteServices.editUser(email, username, phoneNo, oldPhoneNo);
      loadUser();
    }
  }

  void navigateEditProfilePicVIew(String phoneNo){

    Get.to(() => EditProfilePicView(phoneNo));
  }

  void navigateEditUserNameVIew(String username){

    Get.to(() => EditUsernameView(username));
  }

  void navigatePhoneNoNameVIew(String phoneNo){

    Get.to(() => EditPhoneNoView(phoneNo));
  }
}