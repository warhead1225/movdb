import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/tv_shows/controller/tv_shows_details_controller.dart';
import 'package:movdb/presentation/tv_shows/widgets/tv_cast_image.dart';
import 'package:movdb/widgets/content_loading.dart';
import 'package:movdb/widgets/poster_details.dart';

class TvShowsDetails extends StatelessWidget {
  //more than 1 dynamic instance of controller is used
  final tvDetailsController =
      Get.put(TvShowsDetailsController(), tag: Get.arguments.toString());

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
                          PosterDetails(
                            poster: tvDetailsController.tvDetail.posterPath,
                            title: tvDetailsController.tvDetail.title,
                            ratingPercent: tvDetailsController.ratingPercent,
                            rating: tvDetailsController.rating.toString(),
                            genre: tvDetailsController.genre,
                            releaseDate: tvDetailsController.releaseDate,
                          ),
                        ],
                      ),
                      (tvDetailsController.tvDetail.overView.isNotEmpty)
                          ? Container(
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
                            )
                          : SizedBox(),
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
                                      height: getVerticalSize(250),
                                      child: ListView.builder(
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
                : ContentLoading(),
          ),
        ),
      ),
    );
  }
}
