import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/widgets/register_content.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    RegisterViewModel vm = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: RegisterContent(vm),
    );
  }
}
