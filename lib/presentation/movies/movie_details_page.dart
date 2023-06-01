import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/movies/controller/movie_details_controller.dart';
import 'package:movdb/presentation/movies/widgets/cast_image.dart';
import 'package:movdb/widgets/content_loading.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailsPage extends StatelessWidget {
  //more than 1 dynamic instance of controller is used
  final movieDetailController =
      Get.put(MovieDetailsController(), tag: Get.arguments.toString());

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
          child: Obx(
            () => movieDetailController.detailsLoaded.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          Opacity(
                            opacity: 0.7,
                            child: CustomImageView(
                              url: ApiHeaders.imageBase() +
                                  movieDetailController
                                      .movieDetail.backDropPath,
                              height: size.height * .4,
                              width: getHorizontalSize(size.width),
                              fit: BoxFit.cover,
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
                                            movieDetailController
                                                .movieDetail.posterPath,
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
                                            movieDetailController
                                                .movieDetail.title,
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
                                                  percent: movieDetailController
                                                      .ratingPercent,
                                                  center: Text(
                                                    movieDetailController.rating
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
                                                        movieDetailController
                                                            .releaseDate,
                                                        style: AppStyle
                                                            .txtRobotoRegular14,
                                                      ),
                                                      Text(
                                                        movieDetailController
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
                      //Overview
                      (movieDetailController.movieDetail.overView.isNotEmpty)
                          ? Container(
                              width: size.width,
                              padding: getPadding(all: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Overview',
                                    style: AppStyle.txtRobotoBold16,
                                  ),
                                  Container(
                                    margin: getMargin(top: 10),
                                    child: Text(
                                      movieDetailController
                                          .movieDetail.overView,
                                      style: AppStyle.txtRobotoRegular16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),

                      //Video Trailer
                      Obx(
                        () => (movieDetailController.videoObjList.isNotEmpty)
                            ? Container(
                                width: size.width,
                                padding: getPadding(all: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Trailer',
                                      style: AppStyle.txtRobotoBold16,
                                    ),
                                    Container(
                                      margin: getMargin(top: 10),
                                      height: getVerticalSize(200),
                                      child: YoutubePlayer(
                                        controller:
                                            movieDetailController.ytPlayer,
                                        showVideoProgressIndicator: true,
                                        bottomActions: [
                                          CurrentPosition(),
                                          ProgressBar(isExpanded: true),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : (movieDetailController.hasVideo.value)
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

                      Obx(
                        () => (movieDetailController
                                .movieCastObjList.isNotEmpty)
                            ? Container(
                                padding: getPadding(all: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cast',
                                      style: AppStyle.txtRobotoBold16,
                                    ),
                                    Container(
                                      margin: getMargin(top: 10),
                                      width: size.width,
                                      height: getVerticalSize(220),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: movieDetailController
                                            .movieCastObjList.length,
                                        itemBuilder: (c, i) => CastImage(
                                          cast: movieDetailController
                                              .movieCastObjList[i],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : (movieDetailController.hasCast.value)
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
                : ContentLoading(),
          ),
        ),
      ),
    );
  }
}
