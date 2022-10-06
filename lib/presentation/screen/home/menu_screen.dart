import 'package:doctor/presentation/resources/color_manger.dart';
import 'package:flutter/material.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: ColorManger.dark,
    );
  }
}
