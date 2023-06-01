import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/person/controller/person_controller.dart';
import 'package:movdb/presentation/person/widgets/person_movie_item_widget.dart';
import 'package:movdb/presentation/person/widgets/person_show_item_widget.dart';
import 'package:movdb/widgets/content_loading.dart';

class PersonPage extends StatelessWidget {
  //more than 1 dynamic instance of controller is used
  final personController =
      Get.put(PersonController(), tag: Get.arguments.toString());

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
            () => (personController.detailsLoaded.value)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          //cover image
                          Opacity(
                            opacity: 0.5,
                            child: CustomImageView(
                              url: ApiHeaders.imageBase() +
                                  personController.personObj.profilePath!,
                              height: size.height * .4,
                              width: getHorizontalSize(size.width),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                          //Blur effect
                          ClipRRect(
                            // Clip it cleanly.
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                height: size.height * .4,
                                color: Colors.grey.withOpacity(0.1),
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          //profile image
                          Container(
                            margin: getMargin(
                              top: size.height * .13,
                              left: 10,
                              right: 10,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  url: ApiHeaders.imageBase() +
                                      personController.personObj.profilePath!,
                                  height: getVerticalSize(180),
                                  width: getHorizontalSize(130),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: getMargin(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Tooltip(
                                          message:
                                              personController.personObj.name,
                                          child: Text(
                                            personController.personObj.name,
                                            style: AppStyle.txtRobotoBold24,
                                            maxLines: 3,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Birthday: ${personController.personObj.birthday} - ${personController.personObj.age.toString()} yrs old',
                                                style:
                                                    AppStyle.txtRobotoRegular14,
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        (personController
                                                    .personObj.placeOfBirth !=
                                                null)
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Place of Birth: ${personController.personObj.placeOfBirth}',
                                                      style: AppStyle
                                                          .txtRobotoRegular14,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.fade,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Biography
                      (!personController.personObj.bio.isEmpty)
                          ? Container(
                              width: size.width,
                              padding: getPadding(all: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About',
                                    style: AppStyle.txtRobotoBold16,
                                  ),
                                  Container(
                                    margin: getMargin(top: 10),
                                    child: Text(
                                      personController.personObj.bio,
                                      style: AppStyle.txtRobotoRegular16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),

                      //Person Movie List
                      Obx(
                        () => (personController.moviesLoaded.value)
                            ? (personController.movieObjList.isNotEmpty)
                                ? Column(
                                    children: [
                                      Container(
                                        width: size.width,
                                        margin: getMargin(top: 10),
                                        padding:
                                            getPadding(left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Movies',
                                              style: AppStyle.txtRobotoBold16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            getPadding(left: 10, right: 10),
                                        width: size.width,
                                        height: size.height * .30,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: personController
                                              .movieObjList.length,
                                          itemBuilder: (_, i) =>
                                              PersonMovieItemWidget(
                                            movieModel: personController
                                                .movieObjList[i],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),

                      //Person Tv shows
                      Obx(
                        () => (personController.tvShowsLoaded.value)
                            ? (personController.tvShowObjList.isNotEmpty)
                                ? Column(
                                    children: [
                                      Container(
                                        width: size.width,
                                        margin: getMargin(top: 10),
                                        padding:
                                            getPadding(left: 10, right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tv Shows',
                                              style: AppStyle.txtRobotoBold16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            getPadding(left: 10, right: 10),
                                        width: size.width,
                                        height: size.height * .30,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: personController
                                              .tvShowObjList.length,
                                          itemBuilder: (_, i) =>
                                              PersonShowItemWidget(
                                            showModel: personController
                                                .tvShowObjList[i],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                : ContentLoading(),
          ),
        ),
      ),
    );
  }
}
