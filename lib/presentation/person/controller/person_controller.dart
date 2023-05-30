import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/person/models/person_model.dart';

class PersonController extends GetxController {
  final personId = Get.arguments;
  var detailsLoaded = false.obs;

  late PersonModel personObj;

  @override
  void onReady() {
    super.onReady();
    _getPersonBio();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _getPersonBio() async {
    try {
      var personBio = await ApiClient().getPersonBio(this.personId);
      personObj = PersonModel.personObj(personBio);
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
    detailsLoaded.value = true;
  }
}
