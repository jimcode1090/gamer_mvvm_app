import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  String label;
  String errorText;
  String initialValue;
  IconData icon;
  Color colorIcon;
  Function(String text) onChanged;
  bool obscureText;

  DefaultTextField({
    super.key,
    this.errorText = '',
    this.initialValue = '',
    this.obscureText = false,
    required this.label,
    required this.icon,
    required this.colorIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        label: Text(label),
        errorText: errorText,
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: Icon(icon, color: colorIcon),
      ),
      style: TextStyle(color: Colors.white),
      obscureText: obscureText,
    );
  }
}
