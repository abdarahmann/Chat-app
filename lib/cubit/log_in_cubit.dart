// ignore_for_file: unused_local_variable
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  Future<void> logInUser(
      {required String email, required String password}) async {
    try {
      emit(LogInLoading());
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LogInSucces());
    }on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
      emit(LogInFailuere(errMessage: 'No user found for that email.'));
       
       } else if (e.code == 'wrong-password') {
        emit(LogInFailuere(errMessage: 'Wrong password provided for that user.'));
       
                          }
       }  catch (e) {
      emit(LogInFailuere(errMessage: 'There was an Error'));
    }
  }
}
