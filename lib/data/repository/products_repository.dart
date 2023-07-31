import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/data/models/product/product_model.dart';
import 'package:flutter_task/data/models/products/products_model.dart';

class ProductsRepository {
  ProductsRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;
  final FirebaseFirestore _firestore;

  Future<bool> addProducts({required ProductModel productModel}) async {
    try {
      DocumentReference documentReference =
          await _firestore.collection("products").add(productModel.toJson());
      await _firestore
          .collection("products")
          .doc(documentReference.id)
          .update({'id': documentReference.id});
      return documentReference.id.isEmpty;
    } on FirebaseException catch (e) {
      print("ERRROR++++++++++++++++$e");
      return false;
    }
  }

  Future<void> updateProdduct({required ProductsModel productModel}) async {
    try {
      await _firestore
          .collection("products")
          .doc(productModel.id)
          .update(productModel.toJson());
    } on FirebaseException catch (e) {
      print("ERROR=======================$e");
    }
  }

  Stream<List<ProductModel>> getProducts() =>
      _firestore.collection("products").snapshots().map((event) =>
          event.docs.map((e) => ProductModel.fromJson(e.data())).toList());
}
