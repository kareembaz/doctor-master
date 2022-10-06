import 'package:doctor/presentation/resources/color_manger.dart';
import 'package:doctor/presentation/resources/input_Validator.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../resources/asset_manger.dart';

import '../../resources/font_manger.dart';
import '../../resources/route_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';
import 'login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Lottie.asset(JsonAsset.login, height: 280),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(AppStrings.loginNow,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: FontSize.s25)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(AppStrings.loginNowTo,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: FontSize.s15)),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        top: 30,
                      ),
                      child: TextFormField(
                        validator: InputValidator.isEmailValid,
                        controller: controller.userEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: AppStrings.userEmail,
                          hintText: AppStrings.userEmail,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10, bottom: 20),
                      child: TextFormField(
                        validator: InputValidator.isPasswordValid,
                        controller: controller.userPassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          labelText: AppStrings.userPassword,
                          hintText: AppStrings.userPassword,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await controller.login(context);
                              }
                            },
                            child: const Text(AppStrings.signIn)),
                      ),
                    ),
                    Text(AppStrings.or,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: FontSize.s15)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 20, bottom: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ColorManger.white,
                              onPrimary: ColorManger.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(APPSize.s12),
                                  side: const BorderSide(width: 1)),
                            ),
                            onPressed: () async {
                              await controller.googleSignIn(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageAsset.google,
                                  height: 40,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(AppStrings.signInGoogle),
                                const SizedBox(
                                  width: 50,
                                ),
                              ],
                            )),
                      ),
                    ),
                    Text.rich(
                        TextSpan(text: AppStrings.notHaveAccount, children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushReplacementNamed(
                                    context, Routes.registerRoute),
                              text: AppStrings.signUpNotHave,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 17,
                                  ))
                        ]),
                        style: Theme.of(context).textTheme.bodyLarge),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 30),
                      child: Text(AppStrings.policy,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
