import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_state.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {
  LoginState _state = LoginState();

  // Getters
  LoginState get state => _state;

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

  void login() {
    if (state.isValid()) {
      print('Email: ${_state.email.value}');
      print('Password: ${_state.password.value}');
    } else {
      print('Formulario no válido');
    }
  }
}
