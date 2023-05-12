import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';

class TrendingItemWidget extends StatelessWidget {
  final TrendingModel trendingModel;

  const TrendingItemWidget({Key? key, required this.trendingModel})
      : super(key: key);

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
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomImageView(
              fit: BoxFit.cover,
              url: 'https://image.tmdb.org/t/p/original' +
                  trendingModel.posterPath,
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
          ],
        ),
      ),
    );
  }
}
