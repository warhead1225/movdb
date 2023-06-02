import 'package:get/get.dart';
import 'package:movdb/presentation/search_page/controllers/search_controller.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchShowController>(() => SearchShowController());
  }
}
