

import 'package:gamer_mvvm_app/src/domain/use_cases/user/get_user_by_id_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/update_image_use_case.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/user/update_user_use_case.dart';

class UserUseCases {

  GetUserByIdUseCase getById;
  UpdateUserUseCase updateWithoutImage;
  UpdateWhitImageUseCase updateWithImage;


  UserUseCases({
    required this.getById,
    required this.updateWithoutImage,
    required this.updateWithImage
  });

}