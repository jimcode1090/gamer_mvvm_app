import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/injection.dart';
import 'package:gamer_mvvm_app/src/domain/use_cases/auth/auth_use_cases.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_page.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_page.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/home/home_page.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(create: (context) => HomeViewModel(locator<AuthUseCases>()))
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
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
