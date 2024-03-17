part of 'chatt_cubit.dart';

@immutable
sealed class ChattState {}

final class ChattInitial extends ChattState {}

final class ChattSucces extends ChattState {
  List<MessageModel> messages;
  ChattSucces({required this.messages});
}
