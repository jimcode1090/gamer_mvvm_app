import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/assets.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_button.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_text_field.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';


class LoginContent extends StatelessWidget {

  final LoginViewModel vm;

  const LoginContent(this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.32,
                color: BASE_COLOR,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      Assets.imgGamepad,
                      height: 100,
                      width: 150,
                    ),
                    Text(
                      "Gamer MVVM",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "Continua con",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DefaultTextField(
                onChanged: (value) {
                  vm.changeEmail(value);
                },
                errorText: vm.state.email.error,
                label: 'Correo Electrónico',
                icon: Icons.email_outlined,
                colorIcon: Colors.white,

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DefaultTextField(
                onChanged: (value) {
                  vm.changePassword(value);
                },
                obscureText: true,
                errorText: vm.state.password.error,
                label: 'Contraseña',
                icon: Icons.lock_outline,
                colorIcon: Colors.white,

              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: DefaultButton(text: "Iniciar Sesión", onPress: () {
                vm.login();
              }),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'register');
                },
                child: Text(
                  "¿No tienes cuenta?",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
