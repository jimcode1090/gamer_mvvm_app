import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';

abstract class AuthRepository {

  User? get user;

  Future<Resource> login({ required String email, required String password});

  Future<Resource> register(UserModel user);

  Future<void> logout();


}