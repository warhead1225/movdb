import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movdb/core/app_export.dart';

class ShowThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: getVerticalSize(
            200,
          ),
          width: getHorizontalSize(
            100,
          ),
          margin: getMargin(right: 5, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCategorythumbnail30x90,
                height: getVerticalSize(150),
                width: getHorizontalSize(180),
                radius: BorderRadius.circular(
                  getHorizontalSize(2),
                ),
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
                ),
              ),
              Container(
                margin: getMargin(top: 5),
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: getHorizontalSize(
                    100 * 0.12,
                  ),
                  unratedColor: Colors.white,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
