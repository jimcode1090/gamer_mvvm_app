import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/home/home_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/widgets/default_button.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    HomeViewModel vm = Provider.of<HomeViewModel>(context);

    return Scaffold(
      body: Center(
        child: DefaultButton(text: "Cerrar Sesión", onPress: () async {
          await vm.logout();
          Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
        }),
      ),
    );
  }
}
