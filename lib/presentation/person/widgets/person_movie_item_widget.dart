import 'package:flutter/material.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/movies/models/movie_model.dart';

import '../../../core/app_export.dart';

class PersonMovieItemWidget extends StatelessWidget {
  final MovieModel movieModel;

  const PersonMovieItemWidget({Key? key, required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(140),
      margin: getMargin(right: 10),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + movieModel.posterPath,
        height: getVerticalSize(170),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(10),
        alignment: Alignment.center,
        onTap: () => Get.toNamed(
          AppRoutes.movieDetails,
          arguments: movieModel.id,
        ),
      ),
    );
  }
}
