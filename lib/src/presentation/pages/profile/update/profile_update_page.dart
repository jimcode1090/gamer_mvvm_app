import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/update/widgets/profile_update_content.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ProfileUpdateContent(),
    );
  }
}
