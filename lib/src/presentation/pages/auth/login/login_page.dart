import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Column(
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
                    "assets/img/gamepad.png",
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
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Correo Electrónico"),
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(Icons.email_outlined, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                label: Text("Contraseña"),
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(
                  Icons.lock_clock_outlined,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: BASE_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Iniciar Sesión",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 40),
            child: Text(
              "¿No tienes cuenta?",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
