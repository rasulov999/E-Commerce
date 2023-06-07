import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/data/models/products/products_model.dart';

class ProductsRepository {
  ProductsRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;
  final FirebaseFirestore _firestore;

  Future<bool> addProducts({required ProductsModel productsModel}) async {
    try {
      DocumentReference documentReference =
          await _firestore.collection("products").add(productsModel.toJson());
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

  Future<void> updateProdduct({required ProductsModel productsModel}) async {
    try {
      await _firestore
          .collection("products")
          .doc(productsModel.id)
          .update(productsModel.toJson());
    } on FirebaseException catch (e) {
      print("ERROR=======================$e");
    }
  }

  Stream<List<ProductsModel>> getProducts() =>
      _firestore.collection("products").snapshots().map((event) =>
          event.docs.map((e) => ProductsModel.fromJson(e.data())).toList());
}
