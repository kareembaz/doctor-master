import 'package:doctor/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../app/app_prefs.dart';
import '../../../domain/model/onBoarding/model.dart';
import '../../resources/asset_manger.dart';
import '../../resources/route_manger.dart';
import '../../resources/strings_manger.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  static  OnBoardingCubit get(context)=> BlocProvider.of(context);
  final PageController pageController = PageController();
  final AppPreferences _appPreferences=instance<AppPreferences>();
  int indexData=0 ;



  void onPageChanged(index) {
   indexData=index;
   emit(OnBoardingIndex());
  }

  void goNext(context) {
    if (indexData ==3) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
      _appPreferences.setOnBoardingScreenView();
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastLinearToSlowEaseIn);
    }
  }




















  List<SliderObject> getSliderData() => [
    SliderObject(
      image: JsonAsset.onBoarding4,
      title: AppStrings.onboardingTitle1,
      subTitle: AppStrings.onboardingSubTitle,
    ),
    SliderObject(
        image: JsonAsset.onBoarding1,
      title: AppStrings.onboardingTitle2,
      subTitle: AppStrings.onboardingSubTitle
    ),
    SliderObject(
        image: JsonAsset.onBoarding2,
      title: AppStrings.onboardingTitle3,
      subTitle: AppStrings.onboardingSubTitle
    ),
    SliderObject(
      image: JsonAsset.onBoarding3,
      title: AppStrings.onboardingTitle4,
      subTitle: AppStrings.onboardingSubTitle,
    ),
  ];
}
