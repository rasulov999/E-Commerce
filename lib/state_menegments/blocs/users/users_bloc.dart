import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/data/models/users/users_model.dart';
import 'package:flutter_task/data/repository/users_repository.dart';
import 'package:flutter_task/state_menegments/blocs/bloc/add_product_bloc.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.usersRepository})
      : super(const UsersState(status: FormStatus.pure, statusText: "")) {
    on<AddUsers>(_addUser);
  }
  _addUser(AddUsers event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    var newUser = usersRepository.addUser(usersModel: event.usersModel);
    if (newUser != null) {
      emit(
        state.copyWith(status: FormStatus.creatingInSuccess),
      );
    }
  }

  UsersRepository usersRepository;
}
