import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/data/models/products/products_model.dart';
import 'package:flutter_task/data/repository/products_repository.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc({required this.productsRepository})
      : super(const AddProductState(status: FormStatus.pure, statusText: "")) {
    on<AddProducts>(_addProduct);
  }
  ProductsRepository productsRepository;

  _addProduct(AddProducts event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    var newCoffee =
        productsRepository.addProducts(productsModel: event.productsModel);
    if (newCoffee != null) {
      emit(
        state.copyWith(status: FormStatus.creatingInSuccess),
      );
    }
  }
}
