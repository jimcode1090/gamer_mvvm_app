import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/assets.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_button.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_text_field.dart';

class ProfileUpdateContent extends StatelessWidget {
  const ProfileUpdateContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Image.asset(
                Assets.imgBackground,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black38,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60, left: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
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
          margin: EdgeInsets.only(left: 20, right: 20, top: 40),
          child: DefaultTextField(
            label: 'Nombre de usuario',
            icon: Icons.person_2_outlined,
            colorIcon: Colors.white,
            onChanged: (value) {},
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
          child: DefaultButton(
            icon: Icons.edit_attributes,
            text: 'Actualizar Información',
            onPress: () async {},
          ),
        ),
      ],
    );
  }
}
