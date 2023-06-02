import 'package:get/get.dart';
import 'package:movdb/presentation/person/controller/person_controller.dart';

class PersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonController>(() => PersonController());
  }
}
