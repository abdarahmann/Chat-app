// ignore_for_file: prefer_const_constructors
import 'package:chatt_app/Screens/chat_screen.dart';
import 'package:chatt_app/Screens/login_screen.dart';
import 'package:chatt_app/Screens/signup_screen.dart';
import 'package:chatt_app/cubit/cubit/chatt_cubit.dart';
import 'package:chatt_app/cubit/cubit/sign_up_cubit.dart';
import 'package:chatt_app/cubit/log_in_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(NahtayChat());
}

class NahtayChat extends StatelessWidget {
  const NahtayChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogInCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(create: (context)=> ChattCubit())
      ],
      child: MaterialApp(
        routes: {
          LogInPage.id: (context) => LogInPage(),
          SignUp.id: (context) => SignUp(),
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: LogInPage.id,
      ),
    );
  }
}
