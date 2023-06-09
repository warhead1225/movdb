import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/trending/models/trending_model.dart';

class TrendingItemWidget extends StatelessWidget {
  final TrendingModel trendingModel;

  const TrendingItemWidget({Key? key, required this.trendingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(140),
      margin: getMargin(right: 10),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + trendingModel.posterPath,
        height: getVerticalSize(170),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(10),
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
