import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/movies/controller/movie_details_controller.dart';

class MovieDetails extends StatelessWidget {
  final movieDetailController = Get.find<MovieDetailsController>();
  final movieDetails = Get.arguments;

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
                ? Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: CustomImageView(
                          fit: BoxFit.cover,
                          url: ApiHeaders.imageBase() +
                              movieDetailController.movieDetail.backDropPath,
                          height: getVerticalSize(250),
                          width: size.width,
                          alignment: Alignment.center,
                        ),
                      ),
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
                                  child: Text(
                                    movieDetailController.movieDetail.title,
                                    style: AppStyle.txtRobotoBold24,
                                    maxLines: 3,
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : SizedBox(),
          ),
        ),
      ),
    );
  }
}
