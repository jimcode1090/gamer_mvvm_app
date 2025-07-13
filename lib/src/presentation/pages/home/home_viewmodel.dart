

import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';

class HomeViewModel extends ChangeNotifier {


  final AuthUseCases _authUseCases;

  HomeViewModel(this._authUseCases);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;


  logout() async{
    await _authUseCases.logout.launch();
  }

  set currentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

}