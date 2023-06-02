import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          color: Colors.black87,
          width: size.width,
          height: size.height,
          child: Center(
            child: Image.asset(
              ImageConstant.imgAppIcon,
              width: size.width * .5,
            ),
          ),
        ),
      ),
    );
  }
}
