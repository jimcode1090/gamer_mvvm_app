import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';

class RegisterState {
  ValidationItem email;
  ValidationItem password;
  ValidationItem confirmPassword;
  ValidationItem userName;

  RegisterState({
    this.email = const ValidationItem(),
    this.password = const ValidationItem(),
    this.confirmPassword = const ValidationItem(),
    this.userName = const ValidationItem(),
  });

  RegisterState copyWith({
    ValidationItem? email,
    ValidationItem? password,
    ValidationItem? confirmPassword,
    ValidationItem? userName,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      userName: userName ?? this.userName,
    );
  }

  bool isValid() {
    if (email.value.isEmpty ||
        email.error.isNotEmpty ||
        password.value.isEmpty ||
        password.error.isNotEmpty ||
        confirmPassword.value.isEmpty ||
        confirmPassword.error.isNotEmpty ||
        userName.value.isEmpty ||
        userName.error.isNotEmpty ||
        (password.value != confirmPassword.value)) {
      return false;
    }

    return true;
  }
}
