import 'package:get/get.dart';
import 'package:movdb/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:movdb/presentation/main/controller/main_page_controller.dart';
import 'package:movdb/presentation/movies/controller/movies_controller.dart';
import 'package:movdb/presentation/tv_shows/controller/tv_shows_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<MoviesController>(() => MoviesController());
    Get.lazyPut<TvShowsController>(() => TvShowsController());
  }
}
