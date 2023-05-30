import 'package:flutter/material.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/dashboard_page/models/upcoming_model.dart';

import '../../../core/app_export.dart';

class UpcomingItemWidget extends StatelessWidget {
  final UpcomingModel upcomingModel;

  const UpcomingItemWidget({Key? key, required this.upcomingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(140),
      margin: getMargin(right: 10),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + upcomingModel.posterPath!,
        height: getVerticalSize(170),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(getHorizontalSize(2)),
        alignment: Alignment.center,
        onTap: () => Get.toNamed(
          AppRoutes.movieDetails,
          arguments: upcomingModel.id,
        ),
      ),
    );
  }
}
