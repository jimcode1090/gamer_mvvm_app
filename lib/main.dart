import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage()
      },
    );
  }
}
