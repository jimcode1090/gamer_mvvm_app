
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';

class GetUserByIdUseCase {

  final UserRepository _repository;

  GetUserByIdUseCase(this._repository);

  Stream<Resource<UserModel>> launch(String id) => _repository.getUserById(id);

}