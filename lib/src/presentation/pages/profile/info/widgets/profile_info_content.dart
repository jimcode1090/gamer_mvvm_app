import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/assets.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_button.dart';

class ProfileInfoContent extends StatelessWidget {

  final UserModel userData;
  final ProfileInfoViewModel vm;

  const ProfileInfoContent(this.vm,this.userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: DiagonalPathClipperTwo(),
              child: Image.asset(
                Assets.imgBackground,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black38,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 80),
                  width: double.infinity,
                  child: Text(
                    'Perfil de Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(Assets.imgUserImage, height: 150, width: 150),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Text(
            userData.username,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            userData.email,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: DefaultButton(
            icon: Icons.edit,
            color: Colors.white,
            text: 'Editar Datos',
            onPress: () {
              Navigator.pushNamed(context, 'profile/update');
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
          child: DefaultButton(
            icon: Icons.power_settings_new,
            text: 'Cerrar Sesión',
            onPress: () async{
              await vm.logout();
              Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
            },
          ),
        ),
      ],
    );
  }
}
