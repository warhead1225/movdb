import 'package:get/get.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';

class DashboardModel {
  var trendingList = <TrendingModel>[].obs;

  TrendingModel trendingDataObj(Map<String, dynamic> obj) {
    return TrendingModel(
      id: obj['id'],
      backdropPath: obj['backdrop_path'],
      title: obj['title'] ?? obj['name'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      mediaType: obj['media_type'],
      genreId: obj["genre_ids"],
      voteAverage: obj["vote_average"],
    );
  }
}
