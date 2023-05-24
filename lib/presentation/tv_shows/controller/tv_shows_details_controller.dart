import 'package:intl/intl.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/tv_shows/models/tv_cast_model.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_details_model.dart';

class TvShowsDetailsController extends GetxController {
  final tvId = Get.arguments;
  final DateFormat formatter = DateFormat('yyyy');

  var detailsLoaded = false.obs;
  var rating = 0.0;
  var ratingPercent = 0.0;
  var releaseDate = '';
  var genre = '';
  var tvCastObjList = <TvCastModel>[].obs;

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
    var genreDef = <String>[];
    var detail = await ApiClient().getTvDetail(this.tvId);

    tvDetail = TvShowsDetailsModel.tvDetailObj(detail);

    rating = double.parse((tvDetail.voteAverage).toStringAsFixed(1));
    ratingPercent =
        double.parse((tvDetail.voteAverage * 0.10).toStringAsFixed(2));
    releaseDate = formatter.format(DateTime.parse(tvDetail.firstAirDate));

    //list Genre
    tvDetail.genres.forEach((element) {
      genreDef.add(element['name']);
    });
    genre = genreDef.join(', ');
    detailsLoaded.value = true;

    //Cast
    var tvCast = await ApiClient().getTvCast(this.tvId, 1);
    var castList = RxList.generate(
      tvCast.length,
      (i) => TvCastModel.movieCastObj(tvCast[i]),
    );
    tvCastObjList.addAll(castList);
  }
}
