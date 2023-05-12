import 'package:get/get.dart';
import 'package:movdb/presentation/main/controller/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}
