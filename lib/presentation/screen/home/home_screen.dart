import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../resources/asset_manger.dart';
import '../../resources/color_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool drawerIsOpen=false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: drawerIsOpen?ColorManger.dark:ColorManger.white
    ),child: AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(drawerIsOpen?50:0),
        color: ColorManger.white,
      ),

      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 40),
            child:drawerIsOpen? IconButton(
                onPressed: () {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  drawerIsOpen=false;
                  setState(() {  });
                },
                icon: const Icon(Icons.arrow_back_ios)):IconButton(
                onPressed: () {
                  xOffset = 210;
                  yOffset = 200;
                  scaleFactor = 0.6;
                  drawerIsOpen=true;
                  setState(() {  });
                },
                icon: const Icon(Icons.menu)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 50,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(110)),
                      ),
                      color: ColorManger.lightDarkBlue,
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Lottie.asset(
                              JsonAsset.booking,
                              height: 158,
                            ),
                            Text("Booking appointments",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 11.5,
                                        color: ColorManger.darkBlue)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topRight: Radius.circular(120)),
                      ),
                      elevation: 50,
                      color: ColorManger.blue1,
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Lottie.asset(JsonAsset.report),
                            Text("Reservations Report",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        color: ColorManger.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
