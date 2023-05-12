import 'package:movdb/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:movdb/presentation/dashboard_page/widgets/trending_item_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  var dashBoardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 30, shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
            ),
          ],
        ),
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
                  height: getVerticalSize(300),
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgHerocardimage,
                        height: getVerticalSize(300),
                        width: getHorizontalSize(360),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: getMargin(left: 15, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_moonlight".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoBold24),
                                  Padding(
                                    padding: getPadding(top: 9),
                                    child: Row(
                                      children: [
                                        Text(
                                          "April 12, 2023",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRegular12,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: getMargin(right: 15),
                                child: CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 6.0,
                                  percent: 0.7,
                                  center: Text(
                                    "70.0%",
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
                ),
                /* End Featured */

                /* Trending Today */
                Container(
                  margin: getMargin(top: 15, left: 10, right: 10),
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
                            style: AppStyle.txtRobotoRegular14.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
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
                                                .dashBoardModel
                                                .trendingList[index]),
                                  )
                                : SizedBox(),
                          ))
                    ],
                  ),
                ),

                /*  Top Rated Movies */
                /*  Container(
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
                            style: AppStyle.txtRobotoRegular14.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) => TrendingItemWidget(
                              trendingModel: dashBoardController
                                  .dashBoardModel.trendingList[index]),
                        ),
                      )
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
                            style: AppStyle.txtRobotoRegular14.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) => TrendingItemWidget(
                              trendingModel: dashBoardController
                                  .dashBoardModel.trendingList[index]),
                        ),
                      )
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
                            "Upcoming",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoRegular14.copyWith(
                              letterSpacing: getHorizontalSize(0.25),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "View More",
                              style: AppStyle.txtRobotoRegular14.copyWith(
                                letterSpacing: getHorizontalSize(0.25),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: getVerticalSize(180),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) => TrendingItemWidget(
                              trendingModel: dashBoardController
                                  .dashBoardModel.trendingList[index]),
                        ),
                      )
                    ],
                  ),
                ) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
