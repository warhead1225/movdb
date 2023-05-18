import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';

class ShowThumbnail extends StatelessWidget {
  final String imageUrl;
  const ShowThumbnail({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: getVerticalSize(200),
          width: getHorizontalSize(150),
          margin: getMargin(right: 5, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCategorythumbnail30x90,
                //url: ApiHeaders.imageBase() + this.imageUrl,
                height: getVerticalSize(175),
                width: getHorizontalSize(180),
                radius: BorderRadius.circular(getHorizontalSize(2)),
                alignment: Alignment.center,
                onTap: () {},
              ),
              Tooltip(
                message: 'I know what you did last summer',
                child: Text(
                  'I know what you did last summer',
                  style: AppStyle.txtRobotoRegular14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
