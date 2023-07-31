part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent {}

class CreatedUserEvent extends AuthBlocEvent{
  String email;
  String name;
  String password;
  CreatedUserEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}

class LoginUserEvent extends AuthBlocEvent {
  LoginUserEvent({
    required this.email,
    required this.password,
  });
  String email;
  String password;
}
