import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';

class DefaultButton extends StatelessWidget {

  String text;
  Function() onPress;

  DefaultButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
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
              text,
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
    );
  }
}
