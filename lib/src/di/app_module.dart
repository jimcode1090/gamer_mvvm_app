import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gamer_mvvm_app/src/data/repository/auth_repository_impl.dart';
import 'package:gamer_mvvm_app/src/data/repository/user_repository_impl.dart';
import 'package:gamer_mvvm_app/src/di/firebase_service.dart';
import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart';
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/login_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/logout_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/register_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/user_session_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/get_user_by_id_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/update_image_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/update_user_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/user_use_cases.dart';
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
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;

  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection('Users');

  @injectable
  Reference get usersStorageRef => firebaseStorage.ref().child('users');

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth, usersCollection);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(usersCollection, usersStorageRef);


  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    getUser: UserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository)
  );

  @injectable
  UserUseCases get userUseCases => UserUseCases(
    getById: GetUserByIdUseCase(userRepository),
    updateWithoutImage: UpdateUserUseCase(userRepository),
    updateWithImage: UpdateWhitImageUseCase(userRepository),

  );

}
