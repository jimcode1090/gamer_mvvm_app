import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/show_dialog.dart';

class RegisterResponse {
  RegisterViewModel vm;
  BuildContext context;

  RegisterResponse(this.context, this.vm) {
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
    } else if (vm.response is Success) {
      Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    }
  }
}
