import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';
import 'package:movdb/widgets/show_thumbnail.dart';

class TrendingController extends GetxController {
  var dashBoardController = Get.find<DashboardController>();
  late List<TrendingModel> trendingList;

  PagingController<int, ShowThumbnail> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadTrending(List<TrendingModel> trending) async {
    trendingList = trending;
  }
}
