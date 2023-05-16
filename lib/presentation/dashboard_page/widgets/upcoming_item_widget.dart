import 'package:flutter/material.dart';
import 'package:movdb/presentation/dashboard_page/models/upcoming_model.dart';

import '../../../core/app_export.dart';

class UpcomingItemWidget extends StatelessWidget {
  final UpcomingModel upcomingModel;

  const UpcomingItemWidget({Key? key, required this.upcomingModel})
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
                  upcomingModel.posterPath,
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