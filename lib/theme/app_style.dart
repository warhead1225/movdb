import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class AppStyle {
  static TextStyle txtRobotoRegular12 = TextStyle(
    color: ColorConstant.whiteA70090,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 5.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  static TextStyle txtRobotoRegular12WhiteA700a9 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20Black900 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular14 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: ColorConstant.blueGray400,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoBold24 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  static TextStyle txtRobotoBold15 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      15,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );

  static TextStyle txtRobotoBold34 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      34,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular10 = TextStyle(
    color: ColorConstant.whiteA700A9,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
}
