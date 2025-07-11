
import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

class LoginUseCase {

  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  launch({required String email, required String password}) => _authRepository.login(email: email, password: password);


}