import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_movies_model.dart';

class TopRatedMovieItemWidget extends StatelessWidget {
  final TopRatedMoviesModel topRatedMovieModel;

  const TopRatedMovieItemWidget({Key? key, required this.topRatedMovieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: getVerticalSize(
          30,
        ),
        width: getHorizontalSize(
          100,
        ),
        margin: getMargin(
          right: 16,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomImageView(
              fit: BoxFit.cover,
              url: 'https://image.tmdb.org/t/p/original' +
                  topRatedMovieModel.posterPath,
              height: getVerticalSize(
                150,
              ),
              width: getHorizontalSize(
                180,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  2,
                ),
              ),
              alignment: Alignment.center,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
