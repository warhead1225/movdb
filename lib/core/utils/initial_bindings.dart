import 'package:movdb/core/app_export.dart';
import 'package:movdb/core/network/network_info.dart';
import 'package:movdb/data/apiClient/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
