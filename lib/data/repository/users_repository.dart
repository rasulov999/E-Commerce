import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/data/models/users/users_model.dart';

class UsersRepository {
  UsersRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;
  final FirebaseFirestore _firestore;

  Future<bool> addUser({required UsersModel usersModel}) async {
    try {
      DocumentReference documentReference =
          await _firestore.collection("users").add(usersModel.toJson());
      await _firestore
          .collection("users")
          .doc(documentReference.id)
          .update({'id': documentReference.id});
      return documentReference.id.isEmpty;
    } on FirebaseException catch (e) {
      print("ERRROR++++++++++++++++$e");
      return false;
    }
  }

  Future<void> updateUser({required UsersModel usersModel}) async {
    try {
      await _firestore
          .collection("users")
          .doc(usersModel.id)
          .update(usersModel.toJson());
    } on FirebaseException catch (e) {
      print("ERROR=======================$e");
    }
  }

  Stream<List<UsersModel>> getUsers() =>
      _firestore.collection("users").snapshots().map((event) =>
          event.docs.map((e) => UsersModel.fromJson(e.data())).toList());
}
