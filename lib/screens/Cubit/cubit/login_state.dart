part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccs extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailuer extends LoginState {
  LoginFailuer({required this.eMassge});
  String eMassge;
}
