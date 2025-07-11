

import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart';

class LogoutUseCase {

  AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  launch() => _authRepository.logout();

}