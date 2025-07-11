
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/login_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/logout_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/register_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/user_session_use_case.dart';
import 'package:injectable/injectable.dart';

class AuthUseCases {

  LoginUseCase login;
  RegisterUseCase register;
  UserSessionUseCase getUser;
  LogoutUseCase logout;

  AuthUseCases({ required this.login, required this.register, required this.getUser, required this.logout});

}