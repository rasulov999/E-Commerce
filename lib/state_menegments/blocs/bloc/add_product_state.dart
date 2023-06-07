part of 'add_product_bloc.dart';

class AddProductState extends Equatable {
  const AddProductState({
    required this.status,
    required this.statusText,
  });
  final String statusText;
  final FormStatus status;

  AddProductState copyWith({
    FormStatus? status,
    String? statusText,
  }) =>
      AddProductState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
      );
  @override
  List<Object> get props => [
        status,
        statusText,
      ];
}

enum FormStatus {
  pure,
  loading,
  success,
  failure,
   creatingInProgress,
  creatingInSuccess,
  creatingInFailure,
}
