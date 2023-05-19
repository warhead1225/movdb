import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';

class TrendingController extends GetxController {
  final int _numberOfPostsPerRequest = 10;

  var dashBoardController = Get.find<DashboardController>();
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

  void fetchTrending(int pageKey) async {
    trendingListObj.clear();
    var trendingList = await ApiClient().getTrending(page: pageKey);
    var isLastPage = trendingList.length < _numberOfPostsPerRequest;

    for (var trending in trendingList) {
      trendingListObj.add(TrendingModel.trendingObj(trending));
    }

    if (isLastPage) {
      pagingController.appendLastPage(trendingListObj);
    } else {
      var nextPageKey = pageKey + 1;
      pagingController.appendPage(trendingListObj, nextPageKey);
    }
  }
}
