import 'package:get/get.dart';
import 'package:movdb/presentation/top_rated_movies/controller/top_rated_movies_controller.dart';

class TopRatedMoviesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopRatedMoviesController>(() => TopRatedMoviesController());
  }
}
