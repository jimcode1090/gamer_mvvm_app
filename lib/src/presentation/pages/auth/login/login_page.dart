import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_response.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/widgets/login_content.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel vm = Provider.of<LoginViewModel>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LoginResponse(context, vm);
    });

    return Scaffold(backgroundColor: BACKGROUND_COLOR, body: LoginContent(vm));
  }
}
