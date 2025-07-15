
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart';

class UpdateUserUseCase {

  final UserRepository _userRepository;

  UpdateUserUseCase(this._userRepository);

  launch(UserModel userData) async => await _userRepository.updateWithoutImage(userData);


}