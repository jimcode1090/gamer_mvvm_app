import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/update/profile_update_response.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/update/widgets/profile_update_content.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {

    ProfileUpdateViewModel vm = Provider.of<ProfileUpdateViewModel>(context);
    UserModel userDataArg = ModalRoute.of(context)?.settings.arguments as UserModel;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProfileUpdateResponse(context, vm); // CUANDO TODOS LOS ELEMENTOS YA HAN SIDO MOSTRADOS EN PANTALLA
    });

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ProfileUpdateContent(vm, userDataArg),
    );
  }
}
