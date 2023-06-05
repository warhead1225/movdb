import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PosterDetails extends StatelessWidget {
  final String poster;
  final String title;
  final double ratingPercent;
  final String rating;
  final String genre;
  final String releaseDate;

  const PosterDetails({
    Key? key,
    required this.poster,
    required this.title,
    required this.ratingPercent,
    required this.rating,
    required this.genre,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(top: size.height * .13, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Poster image
              Container(
                margin: getMargin(right: 10),
                child: CustomImageView(
                  url: ApiHeaders.imageBase() + this.poster,
                  height: getVerticalSize(180),
                  width: getHorizontalSize(130),
                  radius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: this.title,
                      child: Text(
                        this.title,
                        style: AppStyle.txtRobotoBold24,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: getMargin(top: 10),
                          child: CircularPercentIndicator(
                            radius: 30.0,
                            lineWidth: 6.0,
                            percent: this.ratingPercent,
                            center: Text(
                              this.rating.toString(),
                              style: AppStyle.txtRobotoBold15,
                            ),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.greenAccent,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: getMargin(
                              left: 10,
                              top: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  this.releaseDate,
                                  style: AppStyle.txtRobotoRegular14,
                                ),
                                Tooltip(
                                  message: this.genre,
                                  child: Text(
                                    this.genre,
                                    style: AppStyle.txtRobotoRegular14,
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
