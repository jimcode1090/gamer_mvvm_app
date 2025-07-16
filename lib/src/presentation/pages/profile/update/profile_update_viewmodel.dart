import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/user_use_cases.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/update/profile_update_state.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateViewModel extends ChangeNotifier {
  // States
  ProfileUpdateState _state = ProfileUpdateState();
  Resource _response = Init();
  File? _imageFile;

  // Getters
  ProfileUpdateState get state => _state;

  Resource get response => _response;

  File? get imageFile => _imageFile;

  // UseCases
  final UserUseCases _userUseCases;

  ProfileUpdateViewModel(this._userUseCases);

  update() async {
    _response = Loading();
    
    if (_state.isValid()) {

      if (_imageFile == null) {
        _response = await _userUseCases.updateWithoutImage.launch(
          _state.toUserModel(),
        );
      } else {
        _response = await _userUseCases.updateWithImage.launch(
          _state.toUserModel(),
          _imageFile!,
        );
      }
      notifyListeners();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  loadData(UserModel userModel) {
    _state = _state.copyWith(
      id: ValidationItem(value: userModel.id),
      username: ValidationItem(value: userModel.username),
      image: ValidationItem(value: userModel.image),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  void changeUserName(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(
        username: ValidationItem(value: value, error: ''),
      );
    } else {
      _state = _state.copyWith(
        username: ValidationItem(error: 'Al menos 3 caracteres'),
      );
    }
    notifyListeners();
  }

  resetResponse() {
    _response = Init();
    notifyListeners();
  }
}
