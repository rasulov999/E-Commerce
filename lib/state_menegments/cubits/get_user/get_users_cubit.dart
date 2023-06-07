import 'package:bloc/bloc.dart';
import 'package:flutter_task/data/models/users/users_model.dart';
import 'package:flutter_task/data/repository/users_repository.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit({required this.usersRepository}) : super(InitialUserState()) {
    _fetchData();
  }
  final UsersRepository usersRepository;
  _fetchData() async {
    emit(LoadUsersProgress());
    usersRepository.getUsers().listen((event) {
      emit(LoadUsersInSuccess(usersModel: event));
    });
  }
}
