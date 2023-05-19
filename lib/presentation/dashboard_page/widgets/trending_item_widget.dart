import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';

class TrendingItemWidget extends StatelessWidget {
  final TrendingModel trendingModel;

  const TrendingItemWidget({Key? key, required this.trendingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(30),
      width: getHorizontalSize(100),
      margin: getMargin(right: 16),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + trendingModel.posterPath,
        height: getVerticalSize(150),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(getHorizontalSize(2)),
        alignment: Alignment.center,
        onTap: () => Get.toNamed(
          (trendingModel.mediaType.toLowerCase() == 'movie')
              ? AppRoutes.movieDetails
              : AppRoutes.tvDetails,
          arguments: trendingModel.id,
        ),
      ),
    );
  }
}
