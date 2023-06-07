part of 'users_bloc.dart';

 class UsersState extends Equatable {
  const UsersState({required this.status, required this.statusText});

  final String statusText;
  final FormStatus status;

  UsersState copyWith({
    FormStatus? status,
    String? statusText,
  }) =>
      UsersState(
          status: status ?? this.status,
          statusText: statusText ?? this.statusText);
  @override
  List<Object> get props => [
        status,
        statusText,
      ];
}
