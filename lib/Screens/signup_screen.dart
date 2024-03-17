// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:chatt_app/Constants.dart';
import 'package:chatt_app/Screens/chat_screen.dart';
import 'package:chatt_app/cubit/cubit/sign_up_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/Custom_Snack_Bar.dart';
import '../widgets/Custom_button.dart';
import '../widgets/Custom_text_field.dart';

class SignUp extends StatelessWidget {
  String? email;
  static String id = 'SignUp';
  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isLoading = false;

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
         if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpFailuere) {
          isLoading = false;
          return snackbar(context, state.errMessage);
        } else if (state is SignUpSucces) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } 
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                          'Sign Up',
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
                          BlocProvider.of<SignUpCubit>(context)
                              .signupuser(email: email!, password: password!);
                        }
                      },
                      text: 'Sign up',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "already have account",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            ' Log In',
                            style: TextStyle(
                              color: Colors.yellowAccent,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> signupuser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
