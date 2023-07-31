part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState {}

class AuthInitial extends AuthBlocState {}

class SigningInProgress extends AuthBlocState {}

//Create user
class CreateUserInSuccess extends AuthBlocState {}

class CreateUserInFailury extends AuthBlocState {
  String errorText;
  CreateUserInFailury({required this.errorText});
}

//Sign In

class UserSignedInSuccessfully extends AuthBlocState {}

class UserSignedInFailury extends AuthBlocState {
  String errorText;

  UserSignedInFailury({required this.errorText});
}
