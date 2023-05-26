import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/tv_shows/controller/tv_shows_details_controller.dart';
import 'package:movdb/presentation/tv_shows/widgets/tv_cast_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TvShowsDetails extends StatelessWidget {
  final tvDetailsController = Get.find<TvShowsDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black26,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => tvDetailsController.detailsLoaded.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: CustomImageView(
                              fit: BoxFit.cover,
                              url: ApiHeaders.imageBase() +
                                  tvDetailsController.tvDetail.backDropPath,
                              height: getVerticalSize(250),
                              width: size.width,
                              alignment: Alignment.center,
                            ),
                          ),
                          // Poster and Title
                          Container(
                            margin: getMargin(top: size.height * .13, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: getMargin(right: 10),
                                      child: CustomImageView(
                                        url: ApiHeaders.imageBase() +
                                            tvDetailsController
                                                .tvDetail.posterPath,
                                        height: getVerticalSize(180),
                                        width: getHorizontalSize(130),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tvDetailsController.tvDetail.title,
                                            style: AppStyle.txtRobotoBold24,
                                            maxLines: 3,
                                            overflow: TextOverflow.fade,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: getMargin(top: 10),
                                                child: CircularPercentIndicator(
                                                  radius: 30.0,
                                                  lineWidth: 6.0,
                                                  percent: tvDetailsController
                                                      .ratingPercent,
                                                  center: Text(
                                                    tvDetailsController.rating
                                                        .toString(),
                                                    style: AppStyle
                                                        .txtRobotoBold15,
                                                  ),
                                                  backgroundColor: Colors.grey,
                                                  progressColor:
                                                      Colors.greenAccent,
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: getMargin(
                                                    left: 10,
                                                    top: 10,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        tvDetailsController
                                                            .releaseDate,
                                                        style: AppStyle
                                                            .txtRobotoRegular14,
                                                      ),
                                                      Text(
                                                        tvDetailsController
                                                            .genre,
                                                        style: AppStyle
                                                            .txtRobotoRegular14,
                                                        maxLines: 3,
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
                          ),
                        ],
                      ),
                      Container(
                        width: size.width,
                        padding: getPadding(all: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Overview',
                              style: AppStyle.txtRobotoBold15,
                            ),
                            Container(
                              margin: getMargin(top: 10),
                              child: Text(
                                tvDetailsController.tvDetail.overView,
                                style: AppStyle.txtRobotoRegular14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => (tvDetailsController.tvCastObjList.isNotEmpty)
                            ? Container(
                                padding: getPadding(all: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cast',
                                      style: AppStyle.txtRobotoBold15,
                                    ),
                                    Container(
                                      margin: getMargin(top: 10),
                                      width: size.width,
                                      height: getVerticalSize(220),
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: tvDetailsController
                                            .tvCastObjList.length,
                                        itemBuilder: (c, i) => TvCastImage(
                                          cast: tvDetailsController
                                              .tvCastObjList[i],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : (tvDetailsController.hasCast.value)
                                ? Container(
                                    margin: getMargin(top: 10),
                                    height: getVerticalSize(150),
                                    width: size.width,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : SizedBox(),
                      ),
                    ],
                  )
                : Container(
                    width: size.width,
                    height: size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
