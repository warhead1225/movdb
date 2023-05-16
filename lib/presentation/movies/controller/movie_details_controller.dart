import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/movies/models/movie_detail_model.dart';

class MovieDetailsController extends GetxController {
  final movieId = Get.arguments;
  var detailsLoaded = false.obs;
  late MovieDetailModel movieDetail;

  @override
  void onReady() {
    super.onReady();
    _movieDetail();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _movieDetail() async {
    var detail = await ApiClient().getMovieDetail(this.movieId);
    movieDetail = MovieDetailModel.movieDetailObj(detail);
    detailsLoaded.value = true;
  }
}
