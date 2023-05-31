import 'package:get/get.dart';
import 'package:movdb/presentation/movies/controller/movie_details_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(
      () => MovieDetailsController(),
      fenix: true,
    );
  }
}
