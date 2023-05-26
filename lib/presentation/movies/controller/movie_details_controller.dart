import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/movies/models/movie_cast_model.dart';
import 'package:movdb/presentation/movies/models/movie_detail_model.dart';
import 'package:intl/intl.dart';
import 'package:movdb/presentation/movies/models/movie_videos_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsController extends GetxController {
  final movieId = Get.arguments;
  final DateFormat formatter = DateFormat('yyyy');

  var detailsLoaded = false.obs;
  var rating = 0.0;
  var ratingPercent = 0.0;
  var releaseDate = '';
  var genre = '';
  var videoObjList = <MovieVideosModel>[].obs;
  var movieCastObjList = <MovieCastModel>[].obs;
  var ytPlayer = YoutubePlayerController(initialVideoId: '');
  var hasVideo = true.obs;
  var hasCast = true.obs;

  late MovieDetailModel movieDetail;
  late MovieVideosModel movieVideos;

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

    try {
      var detail = await ApiClient().getMovieDetail(this.movieId);
      movieDetail = MovieDetailModel.movieDetailObj(detail);

      //Rating and Release date
      rating = double.parse((movieDetail.voteAverage).toStringAsFixed(1));
      ratingPercent =
          double.parse((movieDetail.voteAverage * 0.10).toStringAsFixed(2));
      releaseDate = formatter.format(DateTime.parse(movieDetail.releaseDate));

      //List Genre
      movieDetail.genres.forEach((element) {
        genreDef.add(element['name']);
      });
      genre = genreDef.join(', ');
      detailsLoaded.value = true;

      //Trailer Video
      var videos = await ApiClient().getMovieVideos(this.movieId);
      for (var vid in videos) {
        var videoObj = MovieVideosModel.movieVideosObj(vid);
        //Add one video only in the list result
        if (videoObj.site.toString().toLowerCase().trim() == 'youtube') {
          videoObjList.add(MovieVideosModel.movieVideosObj(vid));
          break;
        } else {
          videoObjList.add(MovieVideosModel.movieVideosObj({}));
        }
      }

      //load YT player
      if (videoObjList.isNotEmpty) {
        ytPlayer = YoutubePlayerController(
          initialVideoId: videoObjList.first.key,
          flags: YoutubePlayerFlags(
            autoPlay: false,
            loop: false,
            useHybridComposition: false,
          ),
        );
      } else {
        hasVideo.value = false;
      }

      //Movie Cast
      var cast = await ApiClient().getMovieCast(this.movieId);
      if (cast.isNotEmpty) {
        var castList = RxList.generate(
          cast.length,
          (i) => MovieCastModel.movieCastObj(cast[i]),
        );
        movieCastObjList.addAll(castList);
      } else {
        hasCast.value = false;
      }
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
  }
}
