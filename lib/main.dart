import 'package:edam_merchant/presentation/screens/credentials/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'configurations/utils/my_app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: _lightTheme,
      home: const SplashScreen(),
    );
  }
}

ThemeData _lightTheme = ThemeData(
  // appBarTheme: AppBarTheme(backgroundColor: Colors.white,foregroundColor: Colors.red),
  backgroundColor: Colors.white,
  primarySwatch: Colors.red,
  primaryColor: const Color(0xffab1d00),
  //Color(0xfff7610a);
  indicatorColor: const Color(0xffab1d00),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(

      // foregroundColor: MaterialStateProperty.all<Color>(MyAppColors.appPrimaryColor),
      backgroundColor:
      MaterialStateProperty.all<Color>(MyAppColors.appPrimaryColor),
    ),
  ),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     foregroundColor:
  //         MaterialStateProperty.all<Color>(MyAppColors.appPrimaryColor),
  //   ),
  // ),
  bottomAppBarColor: Colors.grey,
  bottomNavigationBarTheme:
  const BottomNavigationBarThemeData(backgroundColor: Colors.black),
);
