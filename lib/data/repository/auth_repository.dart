import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/data/models/user/user_model.dart';
import 'package:flutter_task/data/storage/storage_repository.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthRepository({required this.firebaseAuth, required this.firebaseFirestore});

  Future<String> resgister({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel newUser = UserModel(
          userId: "",
          imageUrl: "",
          name: name,
          email: email,
          password: password,
          createdAt: DateTime.now());
      var registretedUser =
          await firebaseFirestore.collection("users").add(newUser.toJson());
      await firebaseFirestore
          .collection("users")
          .doc(registretedUser.id)
          .update({"userid": registretedUser.id});
      await StorageRepository.saveUserId(registretedUser.id);
      return "Registered Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> login()async{
    return"dfd";
  }
}
