import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';

class DashboardController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _getTrending();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Get trending shows
  void _getTrending() async {
    var apiClient = ApiClient();
    var trending = await apiClient.getTrending();

    print(trending);
  }
}
