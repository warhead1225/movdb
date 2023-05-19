import 'dart:math';

import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/dashboard_page/models/dashboard_model.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';
import 'package:movdb/presentation/main/controller/main_page_controller.dart';
import 'package:movdb/presentation/trending/controller/TrendingController.dart';

class DashboardController extends GetxController {
  var dashBoardModel = DashboardModel();
  var loadingTrending = true.obs;
  var loadingTopRatedMov = true.obs;
  var loadingTopRatedSeries = true.obs;
  var loadingUpcoming = true.obs;

  late TrendingModel dashBoardFeatured;

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
    var trending =
        await apiClient.getTrending(page: 0); // trending movie and tv series
    var topRatedMov = await apiClient.getTopRatedMovies();
    var topRatedSeries = await apiClient.getTopRatedSeries();
    var upcoming = await apiClient.getUpcoming();

    //Trending Movie/Series list
    var trendingList = RxList.generate(
        trending.length, (i) => dashBoardModel.trendingDataObj(trending[i]));
    dashBoardModel.trendingList.addAll(trendingList);
    dashBoardFeatured = trendingList[Random().nextInt(trendingList.length)];

    //Top Rated Movie List
    var topRatedMovList = RxList.generate(topRatedMov.length,
        (i) => dashBoardModel.topRatedMovieObj(topRatedMov[i]));
    dashBoardModel.topRatedMovList.addAll(topRatedMovList);

    //Top Rated Tv Series
    var topRatedTvList = RxList.generate(topRatedSeries.length,
        (i) => dashBoardModel.topRatedTvObj(topRatedSeries[i]));
    dashBoardModel.topRatedSeriesList.addAll(topRatedTvList);

    //Upcoming list
    var upcomingListObj = RxList.generate(
        upcoming.length, (i) => dashBoardModel.upcomingObj(upcoming[i]));
    dashBoardModel.upcomingList.addAll(upcomingListObj);
  }
}
