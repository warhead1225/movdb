import 'package:get/get.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_movies_model.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_tv_model.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';
import 'package:movdb/presentation/dashboard_page/models/upcoming_model.dart';

class DashboardModel {
  var trendingList = <TrendingModel>[].obs;
  var topRatedMovList = <TopRatedMoviesModel>[].obs;
  var topRatedSeriesList = <TopRatedTvModel>[].obs;
  var upcomingList = <UpcomingModel>[].obs;

  //
  TrendingModel trendingDataObj(Map<String, dynamic> obj) {
    return TrendingModel(
      id: obj['id'],
      title: obj['title'] ?? obj['name'],
      posterPath: obj['poster_path'],
      voteAverage: obj["vote_average"],
    );
  }

  //
  TopRatedMoviesModel topRatedMovieObj(Map<String, dynamic> obj) {
    return TopRatedMoviesModel(
      id: obj['id'],
      title: obj['title'] ?? obj['name'],
      posterPath: obj['poster_path'],
      voteAverage: obj["vote_average"],
    );
  }

  //
  TopRatedTvModel topRatedTvObj(Map<String, dynamic> obj) {
    return TopRatedTvModel(
      id: obj['id'],
      title: obj['title'] ?? obj['name'],
      posterPath: obj['poster_path'],
      voteAverage: obj["vote_average"],
    );
  }

  UpcomingModel upcomingObj(Map<String, dynamic> obj) {
    return UpcomingModel(
      id: obj['id'],
      backdropPath: obj['backdrop_path'],
      title: obj['title'] ?? obj['name'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      genreId: obj["genre_ids"],
      voteAverage: double.parse(obj["vote_average"].toString()),
    );
  }
}
