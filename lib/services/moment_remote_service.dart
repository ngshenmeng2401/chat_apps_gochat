import 'package:chat_apps_gochat/model/moments_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class MomentRemoteServices{

  static final appData = GetStorage();
  static var client = http.Client();

  static Future<List<Moment>?> fetchMoment(String email) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/gochat/php/load_moment.php"),
      body: {
        "email":email,
      });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return momentFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }
}