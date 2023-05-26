import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_model.dart';

class TvShowsThumbnail extends StatelessWidget {
  final TVShowsModel tvshow;

  const TvShowsThumbnail({Key? key, required this.tvshow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.tvDetails,
        arguments: tvshow.id,
      ),
      child: Container(
        width: getHorizontalSize(150),
        margin: getMargin(right: 5, bottom: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              url: ApiHeaders.imageBase() + tvshow.posterPath,
              margin: getMargin(bottom: 5),
              height: getVerticalSize(175),
              width: getHorizontalSize(180),
              radius: BorderRadius.circular(10),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            Tooltip(
              message: tvshow.title,
              child: Text(
                tvshow.title,
                style: AppStyle.txtRobotoRegular14,
                maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
