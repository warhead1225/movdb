import 'package:get/get.dart';
import 'package:movdb/presentation/trending/controller/trending_controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingController>(() => TrendingController());
  }
}
