import 'package:doctor/presentation/resources/color_manger.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'menu_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Stack(
        children: const [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
