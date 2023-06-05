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
    return Container(
      width: getHorizontalSize(150),
      margin: getMargin(right: 16),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Tooltip(
              message: cast.name,
              child: GestureDetector(
                onTap: () =>
                    Get.toNamed(AppRoutes.personPage, arguments: cast.id),
                child: CustomImageView(
                  fit: BoxFit.cover,
                  width: getHorizontalSize(150),
                  radius: BorderRadius.circular(10),
                  alignment: Alignment.center,
                  url: cast.profilePath != ''
                      ? ApiHeaders.imageBase() + cast.profilePath
                      : 'xxxx',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: getMargin(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Tooltip(
                    message: cast.name,
                    child: Text(
                      cast.name,
                      style: AppStyle.txtRobotoBold12,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Expanded(
                    child: Tooltip(
                      message: cast.character,
                      child: Text(
                        cast.character,
                        style: AppStyle.txtRobotoRegular12,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
