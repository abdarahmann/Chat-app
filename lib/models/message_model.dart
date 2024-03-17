import 'package:chatt_app/Constants.dart';

class MessageModel {
  String message;
  String id;
  MessageModel(this.message,this.id);
  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData[keyMessage],jsonData['id']);
  }
}
