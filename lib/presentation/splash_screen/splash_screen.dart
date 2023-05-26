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
          width: size.width,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstant.imgAppIcon,
                  width: size.width * .5,
                ),
                Text('MovDB', style: AppStyle.txtRobotoSplashScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
