import 'package:doctor/presentation/resources/strings_manger.dart';
import 'package:doctor/presentation/screen/home/home_view.dart';
import 'package:doctor/presentation/screen/register/register_view.dart';
import 'package:flutter/material.dart';
import '../screen/login/login_view.dart';
import '../screen/onBoarding/on_boarding_view.dart';

import '../screen/splach/view/splach_view.dart';

class Routes {
  static const String splashRoute = "/"; //main routes
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";

  static const String home = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) =>  OnBoardingView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );


      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) =>  RegisterView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
        body: const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text(AppStrings.noRouteFound)),
        ),
      ),
    );
  }
}
