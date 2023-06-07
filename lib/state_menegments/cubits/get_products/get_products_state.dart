part of 'get_products_cubit.dart';

abstract class GetProductsState  {
}
class InitialProductsState extends GetProductsState {}

class LoadProductsProgress extends GetProductsState {}

class LoadProductsInSuccess extends GetProductsState {
  LoadProductsInSuccess({required this.productsModel});

  final List<ProductsModel> productsModel;
}

class LoadProductsInFailure extends GetProductsState {
  LoadProductsInFailure({required this.error});

  String error;
}