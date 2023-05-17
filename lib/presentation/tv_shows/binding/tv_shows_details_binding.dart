import 'package:get/get.dart';
import 'package:movdb/presentation/tv_shows/controller/tv_shows_details_controller.dart';

class TvShowsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowsDetailsController>(() => TvShowsDetailsController());
  }
}
