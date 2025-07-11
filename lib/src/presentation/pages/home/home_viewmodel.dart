

import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';

class HomeViewModel extends ChangeNotifier {


  final AuthUseCases _authUseCases;

  HomeViewModel(this._authUseCases);


  logout() async{
    await _authUseCases.logout.launch();
  }

}