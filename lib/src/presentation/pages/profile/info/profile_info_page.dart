import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/domain/models/user_model.dart';
import 'package:gamer_mvvm_app/src/domain/utils/resource.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/profile/info/widgets/profile_info_content.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class ProfileInfoPage extends StatelessWidget {
  
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

    ProfileInfoViewModel vm = Provider.of<ProfileInfoViewModel>(context);
    
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      //body: ProfileContent(),
      body: StreamBuilder(
        stream: vm.getUserById(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final response = snapshot.data;

          if (response is Error) {
            final data = response as Error;
            return Center(
              child: Text("Error: ${data.error}"),
            );
          }
          final data = response as Success<UserModel>;
          return ProfileInfoContent(vm, data.data);
        }
      ),
    );
  }
}
