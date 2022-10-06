import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/resources/route_manger.dart';
import '../presentation/resources/theme_manger.dart';
import '../presentation/screen/login/login_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal(); //privet named constructor

  static const MyApp _instance =
      MyApp._internal(); //singleton or single _instance
  factory MyApp() => _instance; //factory

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (BuildContext context) {
          return LoginCubit();
        },)

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "doctor",
          initialRoute: Routes.splashRoute,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: getApplicationTheme(),
        ));
  }
}
