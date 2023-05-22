import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_tv_model.dart';

class TopRatedTvController extends GetxController {
  final int _numberOfPostsPerRequest = 10;
  var topRatedTvListObj = <TopRatedTvModel>[];
  var pagingController =
      PagingController<int, TopRatedTvModel>(firstPageKey: 0);
  var tredingLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    pagingController.addPageRequestListener((pageKey) {
      fetchTopRatedTv(pageKey);
    });
    fetchTopRatedTv(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  void fetchTopRatedTv(int pageKey) async {
    topRatedTvListObj.clear();
    var topRatedList = await ApiClient().getTopRatedSeries(page: pageKey);
    var isLastPage = topRatedList.length < _numberOfPostsPerRequest;

    topRatedTvListObj = List.generate(topRatedList.length,
        (i) => TopRatedTvModel.topRatedObj(topRatedList[i]));

    if (isLastPage) {
      pagingController.appendLastPage(topRatedTvListObj);
    } else {
      var nextPageKey = pageKey + 1;
      pagingController.appendPage(topRatedTvListObj, nextPageKey);
    }
  }
}
