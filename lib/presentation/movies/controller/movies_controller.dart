import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/movies/models/movie_model.dart';

class MoviesController extends GetxController {
  final int _numberOfPostsPerRequest = 10;
  var movieListObj = <MovieModel>[];
  var pagingController = PagingController<int, MovieModel>(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
    pagingController.addPageRequestListener((pageKey) => _fetchMovies(pageKey));
    _fetchMovies(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  //Get now playing movies
  void _fetchMovies(int pageKey) async {
    movieListObj.clear();
    try {
      var topRatedList = await ApiClient().getNowPlayingMovies(page: pageKey);
      var isLastPage = topRatedList.length < _numberOfPostsPerRequest;

      movieListObj = List.generate(
        topRatedList.length,
        (i) => MovieModel.movieObj(topRatedList[i]),
      );

      if (isLastPage) {
        pagingController.appendLastPage(movieListObj);
      } else {
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(movieListObj, nextPageKey);
      }
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
  }
}
