import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_details_model.dart';

class TvShowsDetailsController extends GetxController {
  var tvId = Get.arguments;
  var detailsLoaded = false.obs;
  late TvShowsDetailsModel tvDetail;

  @override
  void onReady() {
    super.onReady();
    _tvDetail();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _tvDetail() async {
    var detail = await ApiClient().getTvDetail(this.tvId);
    tvDetail = TvShowsDetailsModel.tvDetailObj(detail);
    detailsLoaded.value = true;
  }
}
