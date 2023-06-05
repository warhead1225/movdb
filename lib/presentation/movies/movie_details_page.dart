import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/movies/controller/movie_details_controller.dart';
import 'package:movdb/presentation/movies/widgets/cast_image.dart';
import 'package:movdb/widgets/content_loading.dart';
import 'package:movdb/widgets/poster_details.dart';
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
                          PosterDetails(
                            poster:
                                movieDetailController.movieDetail.posterPath,
                            title: movieDetailController.movieDetail.title,
                            ratingPercent: movieDetailController.ratingPercent,
                            rating: movieDetailController.rating.toString(),
                            genre: movieDetailController.genre,
                            releaseDate: movieDetailController.releaseDate,
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
                                          RemainingDuration(),
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
                                      height: getVerticalSize(240),
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
