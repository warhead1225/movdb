import 'package:movdb/presentation/dashboard_page/controller/dashboard_controller.dart';

import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
