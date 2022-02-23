import 'package:chat_apps_gochat/model/user_model.dart';
import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:chat_apps_gochat/services/user_remote_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController{

  final appData = GetStorage();
  String? email;

  var userDetails = <User>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser() async{

    email = appData.read("email")??'';

    try {
      isLoading(true);
      var user = await UserRemoteServices.fetchUser(email!);
      if (user != null) {
        userDetails.assignAll(user);
      } else {
        // productList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void navigateMyProfilePage(){

    Get.toNamed(AppRoutes.MyProfilePage)!.then((value) => loadUser());
  }

  void logOut(){

    appData.write('isLogged', false);
    appData.remove('keepLogin');
    Get.offNamedUntil(AppRoutes.Login, (route) => false);
  }
}