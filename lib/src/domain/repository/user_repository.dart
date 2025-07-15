
import 'dart:io';

import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';

abstract class UserRepository {


  Stream<Resource<UserModel>> getUserById(String id);

  Future<Resource<String>> updateWithoutImage(UserModel userData);
  Future<Resource<String>> updateWithImage(UserModel userData, File image);


}
