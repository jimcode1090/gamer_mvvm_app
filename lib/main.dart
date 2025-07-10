import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_page.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_page.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true
        ),
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
        },
      ),
    );
  }
}
