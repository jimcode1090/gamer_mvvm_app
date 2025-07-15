import 'package:flutter/material.dart';

showSelectImageDialog(
  BuildContext context,
  Function() pickImage,
  Function() takePhoto,
) {
  return showDialog(
    context: context,
    builder:
        (BuildContext context) => AlertDialog(
          title: Text('Selecciona una foto'),
          actions: [
            ElevatedButton(
              onPressed: () {
                pickImage();
                Navigator.pop(context);
              },
              child: Text('Galería', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                takePhoto();
                Navigator.pop(context);
              },
              child: Text('Cámara', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
  );
}
