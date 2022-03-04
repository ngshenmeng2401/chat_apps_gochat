class ChatRoomModel{

  late String? username;
  late String? img;
  late String? chat;
  late String? time;
  late bool? mute;

  ChatRoomModel({
    
    this.username,
    this.img,
    this.chat,
    this.time,
    this.mute,
    
  });
}

class ChatRecordModel{

  late String? username;
  late String? img;
  late String? imgStatus;
  late String? message;
  late String? time;

  ChatRecordModel({
    
    this.username,
    this.img,
    this.imgStatus,
    this.message,
    this.time,    
  });
}