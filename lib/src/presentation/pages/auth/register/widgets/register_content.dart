import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/assets.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_button.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_text_field.dart';

class RegisterContent extends StatelessWidget {

  final RegisterViewModel vm;

  const RegisterContent(this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.27,
            color: BASE_COLOR,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 50, left: 15),
                  child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  },
                    icon: Icon(Icons.arrow_back_ios, size: 35,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(Assets.imgGamepad, height: 100, width: 150),
                    Text(
                      "Gamer MVVM",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
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
            "Registro",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            label: 'Nombre de Usuario',
            errorText: vm.state.userName.error,
            icon: Icons.person_outline,
            colorIcon: Colors.white,
            onChanged: (value) {
              vm.changeUserName(value);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            label: 'Email',
            errorText: vm.state.email.error,
            icon: Icons.email_outlined,
            colorIcon: Colors.white,
            onChanged: (value) {
              vm.changeEmail(value);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            label: 'Contraseña',
            errorText: vm.state.password.error,
            icon: Icons.lock_outline,
            colorIcon: Colors.white,
            obscureText: true,
            onChanged: (value) {
              vm.changePassword(value);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTextField(
            label: 'Confirmar Contraseña',
            errorText: vm.state.confirmPassword.error,
            icon: Icons.lock_outline_rounded,
            colorIcon: Colors.white,
            obscureText: true,
            onChanged: (value) {
              vm.changeConfirmPassword(value);
            },
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: DefaultButton(
            text: 'Registrarse',
            onPress: () {
              vm.register();
            },
          ),
        ),
      ],
    );
  }
}
