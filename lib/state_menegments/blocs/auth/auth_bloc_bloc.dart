import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_task/data/repository/auth_repository.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc(this.authRepository) : super(AuthInitial()) {
    on<CreatedUserEvent>(_createUser);
    on<LoginUserEvent>(_login);
  }
  final AuthRepository authRepository;

  _createUser(CreatedUserEvent event, Emitter emit) async {
    emit(SigningInProgress());
    var response= await authRepository.resgister(email: event.email, password: event.password, name: event.name);
    if(response=="Registered Successfully"){
      emit(CreateUserInSuccess());
    }
    else{
      emit(CreateUserInFailury(errorText: response));
         debugPrint("==============================Error: $response================================================");
    }
  }

  _login(LoginUserEvent event, Emitter emit) async {}
}
