import 'package:flutter/material.dart';
import 'package:gamer_mvvm_app/src/presentation/pages/home/home_viewmodel.dart';

class HomeBottomBar extends StatelessWidget {
  HomeViewModel vm;
  BuildContext context;

  HomeBottomBar(this.context, this.vm, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: vm.currentIndex,
      onTap: (index) {
        vm.currentIndex = index;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Posts'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'My List'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile'
        ),
      ],
    );
  }
}
