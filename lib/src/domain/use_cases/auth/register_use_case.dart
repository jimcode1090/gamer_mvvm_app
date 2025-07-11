import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart';

class RegisterUseCase {

  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  launch(UserModel user) => _authRepository.register(user);

}