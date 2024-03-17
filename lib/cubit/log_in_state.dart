part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLoading extends LogInState {}

final class LogInSucces extends LogInState {}

final class LogInFailuere extends LogInState {
 final String errMessage;

  LogInFailuere({required this.errMessage});
}
