// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable
import 'package:chatt_app/Constants.dart';
import 'package:chatt_app/cubit/cubit/chatt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/bubble_chat.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
  late String message;
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kIcon,
              height: 60,
              width: 60,
            ),
            Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChattCubit, ChattState>(
              builder: (context, state) {
                var messages = BlocProvider.of<ChattCubit>(context).messageList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return messages[index].id == email
                        ? BubbleChat(
                            messageModel: messages[index],
                          )
                        : BubbleFriendChat(messageModel: messages[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                message = data;
                BlocProvider.of<ChattCubit>(context)
                    .sendMessage(message: message, email: email.toString());
                _controller.animateTo(
                  0,
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                );
                controller.clear();
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      BlocProvider.of<ChattCubit>(context).sendMessage(
                          message: message, email: email.toString());
                    },
                    icon: Icon(
                      Icons.send,
                      color: primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(20))),
            ),
          )
        ],
      ),
    );
  }

  
}
