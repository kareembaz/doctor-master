import 'package:doctor/app/di.dart';
import 'package:doctor/domain/model/onBoarding/model.dart';
import 'package:doctor/presentation/resources/asset_manger.dart';
import 'package:doctor/presentation/resources/color_manger.dart';
import 'package:doctor/presentation/resources/strings_manger.dart';

import 'package:doctor/presentation/screen/onBoarding/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../app/app_prefs.dart';
import '../../resources/route_manger.dart';

class OnBoardingView extends StatelessWidget {
   OnBoardingView({Key? key}) : super(key: key);
  final AppPreferences _appPreferences=instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            final controller = OnBoardingCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.loginRoute);
                      _appPreferences.setOnBoardingScreenView();
                    },
                    child: Text(AppStrings.skip,
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              body: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.getSliderData().length,
                  onPageChanged: (index) => controller.onPageChanged(index),
                  itemBuilder: (context, index) {
                    return SliderObjectView(controller.getSliderData()[index]);
                  }),
              bottomSheet: Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(JsonAsset.onBoardingLayer,height: 250),
                  controller.indexData == 3
                      ? SizedBox(
                          width: 85,
                          height: 85,
                          child: CircularProgressIndicator(
                            color: controller.indexData == 3
                                ? ColorManger.green
                                : ColorManger.blue,
                            strokeWidth: 6,
                          ))
                      : CircularStepProgressIndicator(
                          totalSteps: 3,
                          currentStep: controller.indexData,
                          padding: 4 / 20,
                          selectedColor: controller.indexData == 3
                              ? ColorManger.green
                              : ColorManger.blue,
                          width: 85,
                          height: 85,
                          roundedCap: (_, isSelected) => isSelected,
                        ),
                  Positioned(
                    left: 169,
                    child: FloatingActionButton(
                        onPressed: () {
                          controller.goNext(context);
                        },
                        backgroundColor: controller.indexData == 3
                            ? ColorManger.green
                            : ColorManger.blue,
                        child: Icon(
                          controller.indexData == 3
                              ? Icons.check_outlined
                              : Icons.arrow_forward,
                          color: ColorManger.white,
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class SliderObjectView extends StatelessWidget {
  final SliderObject sliderData;
  const SliderObjectView(this.sliderData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Lottie.asset(sliderData.image, height: 400)),
        const SizedBox(
          height: 20,
        ),
        Text(sliderData.title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        Text(sliderData.subTitle,
            style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
