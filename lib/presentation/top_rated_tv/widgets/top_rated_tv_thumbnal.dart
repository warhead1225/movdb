import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_tv_model.dart';

class TopRatedTvThumbnail extends StatelessWidget {
  final TopRatedTvModel topRatedTv;
  const TopRatedTvThumbnail({
    Key? key,
    required this.topRatedTv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.tvDetails,
        arguments: topRatedTv.id,
      ),
      child: Container(
        width: getHorizontalSize(150),
        margin: getMargin(right: 5, bottom: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              url: ApiHeaders.imageBase() + topRatedTv.posterPath,
              margin: getMargin(bottom: 5),
              height: getVerticalSize(175),
              width: getHorizontalSize(180),
              radius: BorderRadius.circular(10),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            Tooltip(
              message: topRatedTv.title,
              child: Text(
                topRatedTv.title,
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
