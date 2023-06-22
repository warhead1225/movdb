import 'package:movdb/core/app_export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _splashTransition();
  }

  void _splashTransition() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offNamed(AppRoutes.mainPageN);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
