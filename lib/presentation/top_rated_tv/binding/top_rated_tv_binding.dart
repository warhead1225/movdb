import 'package:get/get.dart';
import 'package:movdb/presentation/top_rated_tv/controller/top_rated_tv_controller.dart';

class TopRatedTvBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopRatedTvController>(() => TopRatedTvController());
  }
}
