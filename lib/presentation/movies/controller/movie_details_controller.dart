import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/movies/models/movie_cast_model.dart';
import 'package:movdb/presentation/movies/models/movie_detail_model.dart';
import 'package:intl/intl.dart';
import 'package:movdb/presentation/movies/models/movie_videos.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsController extends GetxController {
  final movieId = Get.arguments;
  final DateFormat formatter = DateFormat('yyyy');

  var detailsLoaded = false.obs;
  var rating = 0.0;
  var ratingPercent = 0.0;
  var releaseDate = '';
  var genre = '';
  var videoObjList = <MovieVideosModel>[];
  var movieCastObjList = <MovieCastModel>[];

  var ytPlayer = YoutubePlayerController(initialVideoId: '');

  late MovieDetailModel movieDetail;
  late MovieVideosModel movieVideos;

  /* double.parse((7.491).toStringAsFixed(1)); */

  @override
  void onReady() {
    super.onReady();
    _movieDetail();
  }

  @override
  void onClose() {
    super.onClose();
    ytPlayer.dispose();
  }

  void _movieDetail() async {
    var genreDef = <String>[];
    var detail = await ApiClient().getMovieDetail(this.movieId);
    var videos = await ApiClient().getMovieVideos(this.movieId);

    movieDetail = MovieDetailModel.movieDetailObj(detail);

    rating = double.parse((movieDetail.voteAverage).toStringAsFixed(1));
    ratingPercent =
        double.parse((movieDetail.voteAverage * 0.10).toStringAsFixed(2));
    releaseDate = formatter.format(DateTime.parse(movieDetail.releaseDate));

    //list Genre
    movieDetail.genres.forEach((element) {
      genreDef.add(element['name']);
    });
    genre = genreDef.join(', ');

    videoObjList = List.generate(videos.length, (i) {
      var videoObj = MovieVideosModel.movieVideosObj(videos[i]);

      return (videoObj.site.toString().toLowerCase() == 'youtube')
          ? MovieVideosModel.movieVideosObj(videos[i])
          : MovieVideosModel.movieVideosObj({});
    });

    ytPlayer = YoutubePlayerController(
        initialVideoId: videoObjList.first.key,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
        ));

    detailsLoaded.value = true;
  }
}
