import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/user_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';

class ProfileInfoViewModel extends ChangeNotifier {

  final UserUseCases _userUseCases;
  final AuthUseCases _authUseCases;

  ProfileInfoViewModel(this._userUseCases, this._authUseCases){
    getUserById();
  }

  Stream<Resource<UserModel>> getUserById (){
    final id = _authUseCases.getUser.userSession?.uid ?? '';
    return _userUseCases.getById.launch(id);
  }


  logout() async{
    await _authUseCases.logout.launch();
  }


}