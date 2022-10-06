

import 'dart:async';

import 'package:doctor/presentation/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../resources/color_manger.dart';
import '../../../resources/constant_manger.dart';
import '../../../resources/route_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences=instance<AppPreferences>();
  //instance
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }


  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if(isUserLoggedIn){
        //navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.home),
      }else{
        _appPreferences.isOnBoardingScreenView().then((isOnBoardingScreenView) => {
          if(isOnBoardingScreenView){
            //navigate to login screen
            Navigator.pushReplacementNamed(context, Routes.loginRoute)
          }else{
            //navigate to onBoarding screen
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
          }
        })
      }
    });


  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment:    CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Lottie.asset(JsonAsset.splach),
          SpinKitSquareCircle(
            color: ColorManger.gradationLightBlue,
            size: 40.0,
          ),
          const SizedBox(height: 60,),
          SpinKitSquareCircle(
            color: ColorManger.gradationLightBlue,
            size: 20.0,
          ),

          const SizedBox(height: 60,),
          SpinKitSquareCircle(
            color: ColorManger.gradationLightBlue,
            size: 10.0,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
