import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';

class PosterWidget extends StatelessWidget {
  final String posterImage;
  const PosterWidget({Key? key, required this.posterImage}) : super(key: key);

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
        child: CustomImageView(
          fit: BoxFit.cover,
          url: ApiHeaders.imageBase() + posterImage,
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
        ),
      ),
    );
  }
}
