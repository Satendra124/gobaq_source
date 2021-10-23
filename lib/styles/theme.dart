import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppColors {
  static const Color background = Colors.white;
  static const Color backgroundDull = Color(0xffFAF9FB);

  static const Color onBackground = Color(0xff051655);
  static const Color primary = Color(0xff051655);
  static const Color onPrimary = Colors.white;
  static const Color secondary = Color(0xffEB3D35);
  static const Color primaryDark = Colors.black;
  static const Color border = Colors.black12;
}

class AppStyles {
  static const TextStyle baseStyle = TextStyle(
    fontFamily: "Raleway",
  );
  static const TextStyle h1 = TextStyle(
    color: AppColors.primary,
    fontSize: 70,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle buttonText = TextStyle(
    color: AppColors.primaryDark,
    fontFamily: "Raleway",
    fontWeight: FontWeight.w200,
  );
  static const TextStyle h2 = TextStyle(
    color: AppColors.primary,
    fontSize: 50,
    fontWeight: FontWeight.w700,
    fontFamily: "Raleway",
  );

  static const TextStyle h3 = TextStyle(
    color: AppColors.onPrimary,
    fontSize: 40,
  );
  static const TextStyle h4 = TextStyle(
    color: AppColors.primaryDark,
    fontSize: 20,
  );

  static const TextStyle h1onPrimary = TextStyle(
    color: AppColors.onPrimary,
    fontSize: 50,
  );
  static TextStyle bodyText = TextStyle(
    color: AppColors.primaryDark.withOpacity(0.7),
    fontSize: 15,
    fontFamily: "Raleway",
    fontWeight: FontWeight.w200,
  );

  static const TextStyle sub1 = TextStyle(
    color: AppColors.primaryDark,
    fontSize: 15,
    fontFamily: "Raleway",
    fontWeight: FontWeight.w400,
  );
}
