import 'package:flutter/material.dart';
import 'package:tal2a_seller_app/presentation/home/info.dart';
import 'package:tal2a_seller_app/presentation/resources/color_manager.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Map<String, Widget>> _childrenUser = [
    {'الرئيسية': const HomeScreen()},
    {'عن الشركة': const InfoScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> bottomNavigation = [
      BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: _childrenUser[0].keys.first),
      BottomNavigationBarItem(
          icon: const Icon(Icons.info_outline),
          label: _childrenUser[1].keys.first),
    ];

    return SafeArea(
      child: Scaffold(
        body: SizedBox(width: double.infinity,child: _childrenUser[_currentIndex].values.first),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:Radius.circular(25) ),
          child: BottomNavigationBar(
            items: bottomNavigation,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentIndex,
            elevation: 0.0,
            selectedItemColor: ColorManager.white,
            backgroundColor: ColorManager.primary,
          ),
        ),
      ),
    );
  }
}
