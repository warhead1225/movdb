import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_tv_model.dart';

class TopRatedTvItemWidget extends StatelessWidget {
  final TopRatedTvModel topRatedTvModel;

  const TopRatedTvItemWidget({Key? key, required this.topRatedTvModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(140),
      margin: getMargin(right: 10),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + topRatedTvModel.posterPath,
        height: getVerticalSize(170),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(getHorizontalSize(2)),
        alignment: Alignment.center,
        onTap: () => Get.toNamed(
          AppRoutes.tvDetails,
          arguments: topRatedTvModel.id,
        ),
      ),
    );
  }
}
