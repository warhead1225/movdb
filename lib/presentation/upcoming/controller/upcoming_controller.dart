import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/dashboard_page/models/upcoming_model.dart';

class UpcomingController extends GetxController {
  final int _numberOfPostsPerRequest = 10;
  var upcomingListObj = <UpcomingModel>[];

  var pagingController = PagingController<int, UpcomingModel>(firstPageKey: 0);
  var tredingLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    pagingController
        .addPageRequestListener((pageKey) => fetchUpcoming(pageKey));

    fetchUpcoming(0);
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  void fetchUpcoming(int pageKey) async {
    upcomingListObj.clear();
    try {
      var upcomingList = await ApiClient().getUpcoming(page: pageKey);
      var isLastPage = upcomingList.length < _numberOfPostsPerRequest;

      upcomingListObj = List.generate(
        upcomingList.length,
        (i) => UpcomingModel.upcomingModelObj(upcomingList[i]),
      );

      if (isLastPage) {
        pagingController.appendLastPage(upcomingListObj);
      } else {
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(upcomingListObj, nextPageKey);
      }
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
  }
}
