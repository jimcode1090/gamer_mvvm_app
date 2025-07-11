import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {

  final FirebaseAuth _firebaseAuth;
  final CollectionReference _userCollection;

  AuthRepositoryImpl(this._firebaseAuth, this._userCollection);

  @override
  Future<Resource> login({required String email, required String password}) async {

    try{
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return Success(data);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource> register(UserModel user) async {
    try{
      UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: user.password);
      await _userCollection.doc('${data.user?.uid}').set(user.toJson(includePassword: false, includeId: false));
      return Success(data);
    } on FirebaseAuthException catch(e){
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  // TODO: implement user
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async{
    await _firebaseAuth.signOut();
  }


}