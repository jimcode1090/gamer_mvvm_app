import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_state.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {

  // States
  RegisterState _state = RegisterState();
  Resource _response = Init();


  // Getters
  RegisterState get state => _state;
  Resource get response => _response;

  // Use cases
  final AuthUseCases _authUseCases;

  RegisterViewModel(this._authUseCases);


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


  void register() async{
    if (state.isValid()) {

      _response = Loading(); //Esperando la respuesta
      notifyListeners();
      _response = await _authUseCases.register.launch(_state.toUserModel());
      notifyListeners();

    } else {
      print('Formulario no válido');
    }
  }

  resetResponse(){
    _response = Init();
    notifyListeners();
  }

}