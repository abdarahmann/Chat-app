// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_build_context_synchronously
import 'package:chatt_app/Constants.dart';
import 'package:chatt_app/cubit/cubit/chatt_cubit.dart';
import 'package:chatt_app/cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/Custom_Snack_Bar.dart';
import '../widgets/Custom_Text_field.dart';
import '../widgets/Custom_button.dart';
import '../widgets/user_bottom_q.dart';
import 'chat_screen.dart';

class LogInPage extends StatelessWidget {
  String? email, password;
  static String id = 'LogInPage';

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInLoading) {
          isLoading = true;
        } else if (state is LogInSucces) {
          BlocProvider.of<ChattCubit>(context).reseiveMessage();
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is LogInFailuere) {
          isLoading = false;
          snackbar(context, state.errMessage);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    kIcon,
                    height: 135,
                    width: 135,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nahtay Chat',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    onchange: (data) {
                      email = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    obscureText: true,
                    hintText: 'Password',
                    onchange: (data) {
                      password = data;
                    },
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  CustomButton(
                    ontab: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LogInCubit>(context)
                            .logInUser(email: email!, password: password!);
                      }
                    },
                    text: 'Log in',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  UserBottomQ()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
