

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';

class UserRepositoryImpl implements UserRepository {

  CollectionReference _usersRef;

  UserRepositoryImpl(this._usersRef);

  @override
  Stream<Resource<UserModel>> getUserById(String id) {
    try{

      final data = _usersRef.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map(((document) => Success(UserModel.fromJson(document.data() as Map<String, dynamic>))));
      return dataMap;

    } on FirebaseException catch(e){
      throw Error(e.message ?? 'Error desconocido');/*
    }

  }

}