import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_model.dart';

class TvShowsController extends GetxController {
  final int _numberOfPostsPerRequest = 10;
  var tvshowsListObj = <TVShowsModel>[];
  var pagingController = PagingController<int, TVShowsModel>(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
    pagingController
        .addPageRequestListener((pageKey) => _fetchTvShosAiring(pageKey));
    _fetchTvShosAiring(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  void _fetchTvShosAiring(int pageKey) async {
    tvshowsListObj.clear();
    try {
      var topRatedList = await ApiClient().getAiringSeries(page: pageKey);
      var isLastPage = topRatedList.length < _numberOfPostsPerRequest;

      tvshowsListObj = List.generate(
        topRatedList.length,
        (i) => TVShowsModel.tvShowsObj(topRatedList[i]),
      );

      if (isLastPage) {
        pagingController.appendLastPage(tvshowsListObj);
      } else {
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(tvshowsListObj, nextPageKey);
      }
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
  }
}
