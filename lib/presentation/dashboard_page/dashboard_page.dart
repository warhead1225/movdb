import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:movdb/presentation/dashboard_page/widgets/top_rated_tv_item_widget.dart';
import 'package:movdb/presentation/dashboard_page/widgets/top_rated_movie_item_widget.dart';
import 'package:movdb/presentation/dashboard_page/widgets/trending_item_widget.dart';
import 'package:movdb/presentation/dashboard_page/widgets/upcoming_item_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  final dashBoardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        extendBodyBehindAppBar: true,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* Featured */
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(280),
                  child: Obx(
                    () => dashBoardController
                            .dashBoardModel.trendingList.isNotEmpty
                        ? GestureDetector(
                            onTap: () => Get.toNamed(
                              (dashBoardController.dashBoardFeatured.mediaType
                                          .toLowerCase() ==
                                      'movie')
                                  ? AppRoutes.movieDetails
                                  : AppRoutes.tvDetails,
                              arguments:
                                  dashBoardController.dashBoardFeatured.id,
                            ),
                            child: Stack(
                              children: [
                                CustomImageView(
                                  url: ApiHeaders.imageBase() +
                                      dashBoardController
                                          .dashBoardFeatured.backdropPath,
                                  height: getVerticalSize(300),
                                  width: size.width,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    margin: getMargin(left: 15, bottom: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                dashBoardController
                                                    .dashBoardFeatured.title,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtRobotoBold24,
                                                maxLines: 3,
                                              ),
                                              Text(
                                                dashBoardController
                                                    .dashBoardFeatured.overview,
                                                maxLines: 4,
                                                style:
                                                    AppStyle.txtRobotoRegular14,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              getMargin(right: 15, left: 10),
                                          child: CircularPercentIndicator(
                                            radius: 40.0,
                                            lineWidth: 6.0,
                                            percent: dashBoardController
                                                .featuredRatingRatingPercent,
                                            center: Text(
                                              dashBoardController.featuredRating
                                                  .toString(),
                                              style: AppStyle.txtRobotoBold15,
                                            ),
                                            backgroundColor: Colors.grey,
                                            progressColor: Colors.greenAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
                /* End Featured */

                /* Trending Today */
                Container(
                  margin: getMargin(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRegular16.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(AppRoutes.trending),
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: Obx(
                          () => dashBoardController
                                  .dashBoardModel.trendingList.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 20,
                                  itemBuilder: (context, index) =>
                                      TrendingItemWidget(
                                    trendingModel: dashBoardController
                                        .dashBoardModel.trendingList[index],
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),

                /*  Top Rated Movies */
                Container(
                  margin: getMargin(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Rated Movies",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRegular16.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Get.toNamed(AppRoutes.topRatedMovies),
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: Obx(
                          () => dashBoardController
                                  .dashBoardModel.topRatedMovList.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 20,
                                  itemBuilder: (context, index) =>
                                      TopRatedMovieItemWidget(
                                    topRatedMovieModel: dashBoardController
                                        .dashBoardModel.topRatedMovList[index],
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),

                /* Top Rated Tv series */
                Container(
                  margin: getMargin(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Rated Tv Series",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRegular16.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Get.toNamed(AppRoutes.topRatedTvseries),
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: Obx(
                          () => dashBoardController
                                  .dashBoardModel.topRatedSeriesList.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 20,
                                  itemBuilder: (context, index) =>
                                      TopRatedTvItemWidget(
                                    topRatedTvModel: dashBoardController
                                        .dashBoardModel
                                        .topRatedSeriesList[index],
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),

                /* Upcoming */
                Container(
                  margin: getMargin(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming Movies",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRegular16.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Get.toNamed(AppRoutes.UpComingMovies),
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: Obx(
                          () => dashBoardController
                                  .dashBoardModel.upcomingList.isNotEmpty
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 20,
                                  itemBuilder: (context, index) =>
                                      UpcomingItemWidget(
                                    upcomingModel: dashBoardController
                                        .dashBoardModel.upcomingList[index],
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
