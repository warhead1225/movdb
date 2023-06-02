import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/tv_shows/models/tv_cast_model.dart';

class TvCastImage extends StatelessWidget {
  final TvCastModel cast;

  const TvCastImage({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          Tooltip(
            message: cast.name,
            child: Container(
              margin: getMargin(right: 16, bottom: 10),
              child: CustomImageView(
                fit: BoxFit.cover,
                url: cast.profilePath != ''
                    ? ApiHeaders.imageBase() + cast.profilePath
                    : 'xxxx',
                height: getVerticalSize(170),
                width: getHorizontalSize(150),
                radius: BorderRadius.circular(10),
                alignment: Alignment.center,
              ),
            ),
          ),
          Text(
            cast.name,
            style: AppStyle.txtRobotoBold12,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          Text(
            cast.character,
            style: AppStyle.txtRobotoBold12,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
