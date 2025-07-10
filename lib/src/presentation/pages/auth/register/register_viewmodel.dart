

import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_state.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {

  RegisterState _state = RegisterState();


  RegisterState get state => _state;


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

  void changeUserName(String value) {
    if (value.length <= 3) {
      _state = _state.copyWith(
        userName: ValidationItem(error: 'Al menos 3 caracteres'),
      );
    } else {
      _state = _state.copyWith(userName: ValidationItem(value: value, error: ''));
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

  void changeConfirmPassword(String value) {
    if (value.length >= 6) {
      _state = _state.copyWith(
        confirmPassword: ValidationItem(value: value, error: ''),
      );
    } else {
      _state = _state.copyWith(
        confirmPassword: ValidationItem(error: 'Al menos 6 caracteres'),
      );
    }

    notifyListeners();
  }


  register(){
    if (state.isValid()) {
      print('Email: ${_state.email.value}');
      print('Password: ${_state.password.value}');
    } else {
      print('Formulario no válido');
    }
  }

}