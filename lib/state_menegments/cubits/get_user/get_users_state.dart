part of 'get_users_cubit.dart';

abstract class GetUsersState {}

class InitialUserState extends GetUsersState {}

class LoadUsersProgress extends GetUsersState {}

class LoadUsersInSuccess extends GetUsersState {
  LoadUsersInSuccess({required this.usersModel});

  final List<UsersModel> usersModel;
}

class LoadUsersInFailure extends GetUsersState {
  LoadUsersInFailure({required this.error});

  String error;
}
