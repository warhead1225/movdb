import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_model.dart';

class PersonShowItemWidget extends StatelessWidget {
  final TVShowsModel showModel;

  const PersonShowItemWidget({Key? key, required this.showModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(140),
      margin: getMargin(right: 10),
      child: CustomImageView(
        fit: BoxFit.cover,
        url: ApiHeaders.imageBase() + showModel.posterPath,
        height: getVerticalSize(170),
        width: getHorizontalSize(180),
        radius: BorderRadius.circular(getHorizontalSize(2)),
        alignment: Alignment.center,
        onTap: () => Get.toNamed(
          AppRoutes.tvDetails,
          arguments: showModel.id,
        ),
      ),
    );
  }
}
