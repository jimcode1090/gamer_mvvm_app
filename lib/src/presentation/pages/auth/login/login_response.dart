import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/show_dialog.dart';

class LoginResponse {
  LoginViewModel vm;
  BuildContext context;

  LoginResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      buildShowDialog(context);
    } else if (vm.response is Error) {
      final data = vm.response as Error;
      Navigator.pop(context, true);
      Fluttertoast.showToast(
        msg: 'Error: ${data.error}',
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
      );
      vm.resetResponse();
    } else if (vm.response is Success) {
      vm.resetResponse();
      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
    }
  }
}
