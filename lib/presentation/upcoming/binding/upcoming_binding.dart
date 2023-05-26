import 'package:get/get.dart';
import 'package:movdb/presentation/upcoming/controller/upcoming_controller.dart';

class UpcomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpcomingController>(() => UpcomingController());
  }
}
