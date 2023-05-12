import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/dashboard_page/models/dashboard_model.dart';

class DashboardController extends GetxController {
  var dashBoardModel = DashboardModel();
  var loadingTrending = true.obs;
  var loadingTopRatedMov = true.obs;
  var loadingTopRatedSeries = true.obs;
  var loadingUpcoming = true.obs;

  @override
  void onReady() {
    super.onReady();
    _getData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Get trending shows
  void _getData() async {
    var apiClient = ApiClient();
    var trending = await apiClient.getTrending();
    //var topRatedMov = await apiClient.getTopRatedMovies();
    //var topRatedSeries = await apiClient.getTopRatedSeries();
    //var upcoming = await apiClient.getUpcoming();

    for (var tr in trending) {
      var trendingObj = dashBoardModel.trendingDataObj(tr);
      dashBoardModel.trendingList.add(trendingObj);
    }
  }
}
