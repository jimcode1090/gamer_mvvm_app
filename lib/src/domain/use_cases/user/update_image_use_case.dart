
import 'dart:io';

import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart';

class UpdateWhitImageUseCase {

  final UserRepository _repository;

  UpdateWhitImageUseCase(this._repository);

  launch(UserModel userData, File image) => _repository.updateWithImage(userData, image);

}