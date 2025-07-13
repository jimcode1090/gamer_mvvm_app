import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/widgets/profile_content.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ProfileContent(),
    );
  }
}
