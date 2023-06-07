part of 'users_bloc.dart';

abstract class UsersEvent {}

class AddUsers extends UsersEvent {
  AddUsers({required this.usersModel});
  final UsersModel usersModel;
}
