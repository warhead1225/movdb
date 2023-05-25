import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_movies_model.dart';

class TopRatedMoviesController extends GetxController {
  final int _numberOfPostsPerRequest = 10;
  var topRatedMovieListObj = <TopRatedMoviesModel>[];
  var pagingController =
      PagingController<int, TopRatedMoviesModel>(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
    pagingController.addPageRequestListener((pageKey) {
      fetchTopRatedMovies(pageKey);
    });
    fetchTopRatedMovies(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  void fetchTopRatedMovies(int pageKey) async {
    topRatedMovieListObj.clear();
    try {
      var topRatedList = await ApiClient().getTopRatedMovies(page: pageKey);
      var isLastPage = topRatedList.length < _numberOfPostsPerRequest;

      topRatedMovieListObj = List.generate(
        topRatedList.length,
        (i) => TopRatedMoviesModel.topRatedObj(topRatedList[i]),
      );

      if (isLastPage) {
        pagingController.appendLastPage(topRatedMovieListObj);
      } else {
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(topRatedMovieListObj, nextPageKey);
      }
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
  }
}
