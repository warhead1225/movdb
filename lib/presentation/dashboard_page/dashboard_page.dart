import '../dashboard_page/widgets/categories_item_widget.dart';
import '../dashboard_page/widgets/featured_item_widget.dart';
import '../dashboard_page/widgets/special_item_widget.dart';
import '../dashboard_page/widgets/specials_item_widget.dart';
import '../dashboard_page/widgets/upcoming1_item_widget.dart';
import '../dashboard_page/widgets/upcoming_item_widget.dart';
import 'controller/dashboard_controller.dart';
import 'models/categories_item_model.dart';
import 'models/dashboard_model.dart';
import 'models/featured_item_model.dart';
import 'models/special_item_model.dart';
import 'models/specials_item_model.dart';
import 'models/upcoming1_item_model.dart';
import 'models/upcoming_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/widgets/app_bar/appbar_image.dart';
import 'package:movdb/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class DashboardPage extends StatelessWidget {
  DashboardController controller =
      Get.put(DashboardController(DashboardModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: CustomAppBar(
                height: getVerticalSize(38),
                title: Padding(
                    padding: getPadding(left: 16),
                    child: Text("lbl_nons".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRegular20)),
                actions: [
                  AppbarImage(
                      height: getSize(18),
                      width: getSize(18),
                      svgPath: ImageConstant.imgTrophy,
                      margin: getMargin(left: 18, top: 4, right: 1)),
                  AppbarImage(
                      height: getSize(18),
                      width: getSize(18),
                      svgPath: ImageConstant.imgLock,
                      margin: getMargin(left: 24, top: 4, right: 19))
                ]),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(top: 21, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: getVerticalSize(300),
                                  width: double.maxFinite,
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgHerocardimage,
                                            height: getVerticalSize(300),
                                            width: getHorizontalSize(360),
                                            alignment: Alignment.center),
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 18, bottom: 24),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text("lbl_moonlight".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoBold24),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Row(children: [
                                                            Text(
                                                                "lbl_sub_label"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtRobotoRegular12),
                                                            Container(
                                                                height:
                                                                    getSize(3),
                                                                width:
                                                                    getSize(3),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            17,
                                                                        top: 5,
                                                                        bottom:
                                                                            6),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .whiteA700,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(1)))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 4,
                                                                        top: 2),
                                                                child: Text(
                                                                    "lbl_4_5"
                                                                        .tr
                                                                        .toUpperCase(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRegular10)),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgStar,
                                                                height:
                                                                    getSize(6),
                                                                width:
                                                                    getSize(6),
                                                                margin:
                                                                    getMargin(
                                                                        left: 6,
                                                                        top: 5,
                                                                        bottom:
                                                                            3))
                                                          ]))
                                                    ])))
                                      ])),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 30),
                                      child: Text("lbl_special_for_you".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.25))))),
                              Container(
                                  height: getVerticalSize(186),
                                  child: Obx(() => ListView.separated(
                                      padding: getPadding(left: 18, top: 16),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller.dashboardModelObj
                                          .value.specialsItemList.value.length,
                                      itemBuilder: (context, index) {
                                        SpecialsItemModel model = controller
                                            .dashboardModelObj
                                            .value
                                            .specialsItemList
                                            .value[index];
                                        return SpecialsItemWidget(model);
                                      }))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 36),
                                      child: Text("lbl_upcoming_movies".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.25))))),
                              Container(
                                  height: getVerticalSize(204),
                                  child: Obx(() => ListView.separated(
                                      padding: getPadding(left: 16, top: 19),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller.dashboardModelObj
                                          .value.upcomingItemList.value.length,
                                      itemBuilder: (context, index) {
                                        UpcomingItemModel model = controller
                                            .dashboardModelObj
                                            .value
                                            .upcomingItemList
                                            .value[index];
                                        return UpcomingItemWidget(model);
                                      }))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 20),
                                      child: Text("lbl_featured".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.25))))),
                              Container(
                                  height: getVerticalSize(197),
                                  child: Obx(() => ListView.separated(
                                      padding: getPadding(left: 16, top: 27),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller.dashboardModelObj
                                          .value.featuredItemList.value.length,
                                      itemBuilder: (context, index) {
                                        FeaturedItemModel model = controller
                                            .dashboardModelObj
                                            .value
                                            .featuredItemList
                                            .value[index];
                                        return FeaturedItemWidget(model);
                                      }))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 30),
                                      child: Text("lbl_upcoming_movies".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.25))))),
                              Container(
                                  height: getVerticalSize(209),
                                  child: Obx(() => ListView.separated(
                                      padding: getPadding(left: 16, top: 24),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller.dashboardModelObj
                                          .value.upcoming1ItemList.value.length,
                                      itemBuilder: (context, index) {
                                        Upcoming1ItemModel model = controller
                                            .dashboardModelObj
                                            .value
                                            .upcoming1ItemList
                                            .value[index];
                                        return Upcoming1ItemWidget(model);
                                      }))),
                              Container(
                                  height: getVerticalSize(42),
                                  child: Obx(() => ListView.separated(
                                      padding: getPadding(left: 18, top: 12),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller
                                          .dashboardModelObj
                                          .value
                                          .categoriesItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                        CategoriesItemModel model = controller
                                            .dashboardModelObj
                                            .value
                                            .categoriesItemList
                                            .value[index];
                                        return CategoriesItemWidget(model,
                                            onTapImgCategorythumbnail: () {
                                          onTapImgCategorythumbnail();
                                        });
                                      }))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 16, top: 14),
                                      child: Text("lbl_special_for_you".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtRobotoRegular14
                                              .copyWith(
                                                  letterSpacing:
                                                      getHorizontalSize(
                                                          0.25))))),
                              Container(
                                  height: getVerticalSize(202),
                                  child: Obx(() => ListView.separated(
                                      padding: getPadding(left: 16, top: 32),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller.dashboardModelObj
                                          .value.specialItemList.value.length,
                                      itemBuilder: (context, index) {
                                        SpecialItemModel model = controller
                                            .dashboardModelObj
                                            .value
                                            .specialItemList
                                            .value[index];
                                        return SpecialItemWidget(model);
                                      })))
                            ]))))));
  }

  onTapImgCategorythumbnail() {
    // TODO: implement Actions
  }
}
