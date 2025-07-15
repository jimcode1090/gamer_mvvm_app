import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/validation_item.dart';

class ProfileUpdateState {
  ValidationItem id;
  ValidationItem username;
  ValidationItem image;

  ProfileUpdateState({
    this.id = const ValidationItem(),
    this.username = const ValidationItem(),
    this.image = const ValidationItem(),
  });

  toUserModel() =>
      UserModel(id: id.value, username: username.value, image: image.value);

  ProfileUpdateState copyWith({
    ValidationItem? id,
    ValidationItem? username,
    ValidationItem? image,
  }) => ProfileUpdateState(
    id: id ?? this.id,
    username: username ?? this.username,
    image: image ?? this.image,
  );

  bool isValid() {
    if (id.value.isEmpty ||
        id.error.isNotEmpty ||
        username.value.isEmpty ||
        username.error.isNotEmpty) {
      return false;
    }
    return true;
  }
}
