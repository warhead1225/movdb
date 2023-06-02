import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/movies/models/movie_model.dart';
import 'package:movdb/presentation/person/models/person_model.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_model.dart';

class PersonController extends GetxController {
  final personId = Get.arguments;
  var detailsLoaded = false.obs;
  var moviesLoaded = false.obs;
  var tvShowsLoaded = false.obs;
  var movieObjList = <MovieModel>[];
  var tvShowObjList = <TVShowsModel>[];

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
      detailsLoaded.value = true;

      //Get Artist Movies
      var personMovies = await ApiClient().getPersonMovies(this.personId);
      for (var mov in personMovies) {
        if (mov['poster_path'] != null) {
          movieObjList.add(MovieModel.movieObj(mov));
        }
      }
      moviesLoaded.value = true;

      //Get Artist Movies
      var personShows = await ApiClient().getPersonTvShows(this.personId);
      for (var show in personShows) {
        if (show['poster_path'] != null) {
          tvShowObjList.add(TVShowsModel.tvShowsObj(show));
        }
      }
      tvShowsLoaded.value = true;
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
      detailsLoaded.value = true;
    }
  }
}
