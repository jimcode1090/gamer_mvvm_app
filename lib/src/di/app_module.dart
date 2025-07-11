import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamer_mvvm_app/src/data/repository/auth_repository_impl.dart';
import 'package:gamer_mvvm_app/src/di/firebase_service.dart';
import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/login_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/logout_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/register_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/user_session_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection('Users');


  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth, usersCollection);


  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    getUser: UserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );

}
