part of 'add_product_bloc.dart';

abstract class AddProductEvent {}

class AddProducts extends AddProductEvent {
  AddProducts({required this.productModel});
  final ProductModel productModel;
}
