import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/trending/models/trending_model.dart';

class TrendingController extends GetxController {
  final int _numberOfPostsPerRequest = 10;
  var trendingListObj = <TrendingModel>[];

  var pagingController = PagingController<int, TrendingModel>(firstPageKey: 0);
  var tredingLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    pagingController.addPageRequestListener((pageKey) {
      fetchTrending(pageKey);
    });

    fetchTrending(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  //Fetch trending per page
  void fetchTrending(int pageKey) async {
    trendingListObj.clear();
    var trendingList = await ApiClient().getTrending(page: pageKey);
    var isLastPage = trendingList.length < _numberOfPostsPerRequest;

    trendingListObj = List.generate(
      trendingList.length,
      (i) => TrendingModel.trendingObj(trendingList[i]),
    );

    if (isLastPage) {
      pagingController.appendLastPage(trendingListObj);
    } else {
      var nextPageKey = pageKey + 1;
      pagingController.appendPage(trendingListObj, nextPageKey);
    }
  }
}
