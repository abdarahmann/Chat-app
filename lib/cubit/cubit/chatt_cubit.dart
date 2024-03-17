import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../Constants.dart';
import '../../models/message_model.dart';

part 'chatt_state.dart';

class ChattCubit extends Cubit<ChattState> {
  ChattCubit() : super(ChattInitial());
  List<MessageModel> messageList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(keyMessageCollection);
  void sendMessage({required String message, required String email}) {
    messages.add({"message": message, kCreatedAt: DateTime.now(), 'id': email});
  }

  void reseiveMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
      }
      emit(ChattSucces(messages: messageList));
    });
  }
}
