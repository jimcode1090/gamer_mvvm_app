import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/home/home_viewmodel.dart';
import 'package:gamer_mvvm_app/src/presentation/utils/base_color.dart';

class HomeBottomBar extends StatelessWidget {
  final HomeViewModel vm;
  BuildContext context;

  HomeBottomBar(this.context, this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: BACKGROUND_COLOR,
      currentIndex: vm.currentIndex,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        vm.currentIndex = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt, color: Colors.white,),
          label: 'Posts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list, color: Colors.white,),
          label: 'My List'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.white,),
          label: 'Profile'
        ),
      ],
    );
  }
}
