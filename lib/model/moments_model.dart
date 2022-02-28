// To parse this JSON data, do
//
//     final moment = momentFromJson(jsonString);

import 'dart:convert';

List<Moment> momentFromJson(String str) => List<Moment>.from(json.decode(str).map((x) => Moment.fromJson(x)));

String momentToJson(List<Moment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Moment {
    Moment({
        this.emailA,
        this.emailB,
        this.postId,
        this.content,
        this.momentImg,
        this.username,
        this.phoneNo,
        this.profileImg,
    });

    String? emailA;
    String? emailB;
    String? postId;
    String? content;
    String? momentImg;
    String? username;
    String? phoneNo;
    String? profileImg;

    factory Moment.fromJson(Map<String, dynamic> json) => Moment(
        emailA: json["emaila"],
        emailB: json["emailb"],
        postId: json["post_id"],
        content: json["content"],
        momentImg: json["moment_img"],
        username: json["username"],
        phoneNo: json["phone_no"],
        profileImg: json["profile_img"],
    );

    Map<String, dynamic> toJson() => {
        "emaila": emailA,
        "emailb": emailB,
        "post_id": postId,
        "content": content,
        "moment_img": momentImg,
        "username": username,
        "phone_no": phoneNo,
        "profile_img": profileImg,
    };
}

// enum Email { MENG_GMAIL_COM, JIMMYTAN_GMAIL_COM, STARGOH_GMAIL_COM }

// final emailValues = EnumValues({
//     "jimmytan@gmail.com": Email.JIMMYTAN_GMAIL_COM,
//     "meng@gmail.com": Email.MENG_GMAIL_COM,
//     "stargoh@gmail.com": Email.STARGOH_GMAIL_COM
// });

// enum Img { NOIMAGE, YES }

// final imgValues = EnumValues({
//     "noimage": Img.NOIMAGE,
//     "yes": Img.YES
// });

// enum Username { BIG_MOUTH_MENG, JIMMY_TAN, STAR_GOH }

// final usernameValues = EnumValues({
//     "Big Mouth Meng": Username.BIG_MOUTH_MENG,
//     "Jimmy Tan": Username.JIMMY_TAN,
//     "Star Goh": Username.STAR_GOH
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }



class MomentModal{

  late String? id;
  late String? email;
  late String? content;
  late String? imgStatus;

  MomentModal({

    this.id,
    this.email,
    this.content,
    this.imgStatus,

  });
}