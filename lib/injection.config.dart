// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:gamer_mvvm_app/src/di/app_module.dart' as _i449;
import 'package:gamer_mvvm_app/src/di/firebase_service.dart' as _i859;
import 'package:gamer_mvvm_app/src/domain/repository/auth_repository.dart'
    as _i240;
import 'package:gamer_mvvm_app/src/domain/repository/user_repository.dart'
    as _i416;
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart'
    as _i660;
import 'package:gamer_mvvm_app/src/domain/use_cases/user/user_use_cases.dart'
    as _i566;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    await gh.factoryAsync<_i859.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i59.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i974.FirebaseFirestore>(() => appModule.firebaseFirestore);
    gh.factory<_i457.FirebaseStorage>(() => appModule.firebaseStorage);
    gh.factory<_i974.CollectionReference<Object?>>(
      () => appModule.usersCollection,
    );
    gh.factory<_i457.Reference>(() => appModule.usersStorageRef);
    gh.factory<_i240.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i416.UserRepository>(() => appModule.userRepository);
    gh.factory<_i660.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i566.UserUseCases>(() => appModule.userUseCases);
    return this;
  }
}

class _$AppModule extends _i449.AppModule {}
