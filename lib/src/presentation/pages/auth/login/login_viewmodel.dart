import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_state.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {
  // States
  LoginState _state = LoginState();
  Resource _response = Init();

  // Getters
  LoginState get state => _state;
  Resource get response => _response;

  // UseCases
  final AuthUseCases _authUseCases;

  LoginViewModel(this._authUseCases) {
    final user = this._authUseCases.getUser.userSession;
    if(user != null){
      _response = Success(user);
    }
    print('User Session: ${_authUseCases.getUser.userSession}');
  }

  // Setters
  void changeEmail(String value) {
    final bool emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value);

    if (value.length <= 3) {
      _state = _state.copyWith(
        email: ValidationItem(error: 'Al menos 3 caracteres'),
      );
    } else if (!emailRegex) {
      _state = _state.copyWith(
        email: ValidationItem(error: 'Correo electrónico no valido'),
      );
    } else {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    }

    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6) {
      _state = _state.copyWith(
        password: ValidationItem(value: value, error: ''),
      );
    } else {
      _state = _state.copyWith(
        password: ValidationItem(error: 'Al menos 6 caracteres'),
      );
    }

    notifyListeners();
  }

  void login() async {
    if (state.isValid()) {
      _response = Loading(); //Esperando la respuesta
      notifyListeners();

      _response = await _authUseCases.login.launch(
        email: _state.email.value,
        password: _state.password.value,
      );

      notifyListeners();
      print('Response ${_response}');
      
    } else {
      print('El formulario no es valido');
    }
  }

  resetResponse(){
    _response = Init();
    notifyListeners();
  }
}
