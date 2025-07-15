import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:path/path.dart';

class UserRepositoryImpl implements UserRepository {
  final CollectionReference _usersRef;
  final Reference _usersStorageRef;

  UserRepositoryImpl(this._usersRef, this._usersStorageRef);

  @override
  Stream<Resource<UserModel>> getUserById(String id) {
    try {
      final data = _usersRef.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map(
        ((document) {
          return Success(
            UserModel.fromJson(document.data() as Map<String, dynamic>, id: document.id),
          );
        }),
      );

      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> updateWithoutImage(UserModel userData) async {
    try {
      Map<String, dynamic> map = {
        'username': userData.username,
        'image': userData.image,
      };
      await _usersRef.doc(userData.id).update(map);
      return Success("El usuario se actualizo correctamente");
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

  @override
  Future<Resource<String>> updateWithImage(UserModel userData, File image) async {
    print("Actualizando el usuario con imagen");
    print("Datos del usuario: ${userData.toString()}");
    print("Datos de la imagen: ${image.toString()}");
    try {
      String name = basename(image.path);
      TaskSnapshot uploadTask = await _usersStorageRef.child(name).putFile(image, SettableMetadata(
        contentType: 'image/png'
      ));

      String url = await uploadTask.ref.getDownloadURL();
      print("Nombre de la imagen en firebase storage: ${url}");

      Map<String, dynamic> map = {
        'username': userData.username,
        'image': url,
      };
      await _usersRef.doc(userData.id).update(map);
      return Success("El usuario se actualizo correctamente");
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
}
