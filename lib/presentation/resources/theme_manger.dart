import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'color_manger.dart';
import 'font_manger.dart';
import 'styles_manger.dart';
import 'values_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ColorManger.white
      ),
//main color
      primaryColor: ColorManger.backGround,
      scaffoldBackgroundColor: ColorManger.white,
//Button theme
      buttonTheme: ButtonThemeData(
          buttonColor: ColorManger.lightBlue,
          disabledColor: ColorManger.darkBlue,
          splashColor: ColorManger.blue,
          shape: const StadiumBorder()),

//elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: getBoldStyle(
              fontSize: FontSize.s16,
              color: ColorManger.blue,
            ),
            primary: ColorManger.blue,
            onPrimary: ColorManger.white,
            onSurface: ColorManger.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(APPSize.s12)),
            fixedSize: const Size.fromHeight(AppPadding.p50),
          )),

//appbar theme
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManger.white,
              statusBarIconBrightness: Brightness.dark),
          centerTitle: true,
          elevation: APPSize.s0,
          iconTheme: IconThemeData(
            color:  ColorManger.white,
            size: AppPadding.p20,
          ),
          titleTextStyle: getMediumStyle(
            fontSize: FontSize.s15,
            color: ColorManger.white,
          ),
          color: ColorManger.white),

//text theme

      textTheme: TextTheme(
// using in text on boarding
        titleLarge: getBoldStyle(
          fontSize: FontSize.s18,
          color: ColorManger.blue,
        ),
//using in profile page
        headlineSmall: getSemiBoldStyle(
            fontSize: FontSize.s13, color: ColorManger.blackText),

//using in missing page
        bodySmall: getBoldStyle(
            fontSize: FontSize.s25, color: ColorManger.blue),

// using in text on boarding
        headlineMedium: getMediumStyle(
          fontSize: FontSize.s14,
          color: ColorManger.black,
        ),

//use in on boarding  button
        titleSmall: getSemiBoldStyle(
          fontSize: FontSize.s12,
          color: ColorManger.black,
        ),

//use in on boarding  button
        headlineLarge: getMediumStyle(
          fontSize: FontSize.s12,
          color: ColorManger.white,
        ),
          //use in on about profile page
        bodyLarge: getMediumStyle(
            fontSize:FontSize.s14,
            color: ColorManger.blackText),
      ),

/// input decoration theme ( text form field )
      inputDecorationTheme: InputDecorationTheme(
        //Content padding
        contentPadding: const EdgeInsets.all(AppPadding.p19),

        //label text style
        labelStyle: getMediumStyle(
            fontSize: FontSize.s12, color: ColorManger.darkGrey),

        //hint style
        hintStyle: getRegularStyle(
            fontSize: FontSize.s12, color: ColorManger.grey),

        //error style
        errorStyle: getRegularStyle(
            fontSize: FontSize.s10, color: ColorManger.error),



        //background color
        filled: true,
        fillColor: ColorManger.white,

        //focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.blue),
            borderRadius: BorderRadius.circular(
                APPSize.s18
            )),


        //enable border style
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                APPSize.s10
            ),
            borderSide:
            BorderSide(color: ColorManger.darkGrey, width: AppPadding.p0_8)),

        //error border style
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(APPSize.s12),
            borderSide:
            BorderSide(color: ColorManger.error, width: AppPadding.p0_8)),


        // error focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(APPSize.s12),
            borderSide:
            BorderSide(color: ColorManger.error, width: AppPadding.p0_8)),
      ));
}