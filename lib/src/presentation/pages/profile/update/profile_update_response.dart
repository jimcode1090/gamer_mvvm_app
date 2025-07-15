import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/show_dialog.dart';

class ProfileUpdateResponse {
  ProfileUpdateViewModel vm;
  BuildContext context;

  ProfileUpdateResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      print("El response ha cambiado a Loading");
      buildShowDialog(context);
    } else if (vm.response is Error) {
      print("El response ha cambiado a Error");
      final data = vm.response as Error;
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: data.error,
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG,
      );
      vm.resetResponse();
    } else if (vm.response is Success) {
      print("El response ha cambiado a Success");
      final success = vm.response as Success<String>;
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: success.data,
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG,
      );
      vm.resetResponse();
    }
  }
}
