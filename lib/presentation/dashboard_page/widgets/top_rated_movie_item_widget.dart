import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_movies_model.dart';

class TopRatedMovieItemWidget extends StatelessWidget {
  final TopRatedMoviesModel topRatedMovieModel;

  const TopRatedMovieItemWidget({Key? key, required this.topRatedMovieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(140),
      margin: getMargin(right: 10),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + topRatedMovieModel.posterPath,
        height: getVerticalSize(170),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(getHorizontalSize(2)),
        alignment: Alignment.center,
        onTap: () => Get.toNamed(
          AppRoutes.movieDetails,
          arguments: topRatedMovieModel.id,
        ),
      ),
    );
  }
}
