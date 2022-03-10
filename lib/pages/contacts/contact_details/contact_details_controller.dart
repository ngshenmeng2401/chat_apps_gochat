import 'package:chat_apps_gochat/model/friend_model.dart';
import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:chat_apps_gochat/pages/contacts/chat/chat_record_view.dart';
import 'package:chat_apps_gochat/services/moment_remote_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ContactDetailController extends GetxController{

  static final appData = GetStorage();

  var momentList = <Moment>[].obs;

  late String friendEmail;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {
    loadMomentList();
    super.onInit();
  }

  void loadMomentList() async{

    friendEmail = appData.read("friendEmail")??'';

    
    var moment = await MomentRemoteServices.fetchContactMoment(friendEmail);
    if (moment != null) {
      momentList.clear();
      momentList.assignAll(moment);
    } else {
      statusMsj("No any post".tr);
    }
  }

  void navigateChatRecordView(Friend friend){

    Get.to(() => ContactChatRecordView(friend));
  }
}