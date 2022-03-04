import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChatRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();
}