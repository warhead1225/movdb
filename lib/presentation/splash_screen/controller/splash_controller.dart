import 'package:movdb/core/app_export.dart';

import 'package:movdb/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();
    _splashTransition();
  }

  void _splashTransition() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offNamed(AppRoutes.dashboardPage);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
