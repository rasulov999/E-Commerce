import 'package:bloc/bloc.dart';
import 'package:flutter_task/data/models/product/product_model.dart';
import 'package:flutter_task/data/repository/products_repository.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit({required this.repository}) : super(InitialProductsState()) {
    _fetchData();
  }
  final ProductsRepository repository;

  _fetchData() async {
    emit(LoadProductsProgress());
    repository.getProducts().listen((event) {
      emit(LoadProductsInSuccess(productModel: event));
    });
  }
}
