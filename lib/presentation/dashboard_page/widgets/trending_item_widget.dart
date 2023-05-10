import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class TrendingItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: getVerticalSize(
          30,
        ),
        width: getHorizontalSize(
          90,
        ),
        margin: getMargin(
          right: 16,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCategorythumbnail30x90,
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
              onTap: () {},
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  right: 20,
                ),
                child: Text(
                  "ssdsd",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRegular14.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
