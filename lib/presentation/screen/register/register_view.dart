import 'package:doctor/presentation/resources/input_Validator.dart';
import 'package:doctor/presentation/screen/login/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../resources/asset_manger.dart';
import '../../resources/color_manger.dart';
import '../../resources/font_manger.dart';
import '../../resources/route_manger.dart';
import '../../resources/strings_manger.dart';
import '../../resources/values_manger.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Lottie.asset(JsonAsset.login, height: 280),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(AppStrings.registerNow,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: FontSize.s25)),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(AppStrings.registerNowTo,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: FontSize.s15)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 20, bottom: 10),
                      child: TextFormField(
                        validator: InputValidator.isNameValid,
                        controller: controller.userName,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: AppStrings.userName,
                          hintText: AppStrings.userName,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 10,),
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
                          left: 20.0, right: 20, top: 10, bottom: 10),
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
                          left: 20.0, right: 20, top: 10, bottom: 25),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async{
                              if (_formKey.currentState!.validate()) {
                                await controller.register(context);
                                // Navigator.of(context)
                                //     .pushReplacementNamed(Routes.otp);
                              }
                            },
                            child: const Text(AppStrings.register)),
                      ),
                    ),
                    Text(AppStrings.or,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: FontSize.s15)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 25, bottom: 30),
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
                            onPressed: () async{
                                await controller.googleSignIn(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageAsset.google,
                                  height: 60,
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
                        TextSpan(text: AppStrings.hasAnyAccount, children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.pushReplacementNamed(
                                    context, Routes.loginRoute),
                              text: AppStrings.signHere,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 17,
                                  ))
                        ]),
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 40,)
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
