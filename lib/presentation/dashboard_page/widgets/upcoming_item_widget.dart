import '../controller/dashboard_controller.dart';
import '../models/upcoming_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

// ignore: must_be_immutable
class UpcomingItemWidget extends StatelessWidget {
  UpcomingItemWidget(this.upcomingItemModelObj);

  UpcomingItemModel upcomingItemModelObj;

  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCardbox143x90,
              height: getVerticalSize(
                143,
              ),
              width: getHorizontalSize(
                90,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  2,
                ),
              ),
            ),
            Container(
              width: getHorizontalSize(
                65,
              ),
              margin: getMargin(
                left: 2,
                top: 10,
              ),
              child: Obx(
                () => Text(
                  upcomingItemModelObj.titleTxt.value,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRegular12WhiteA700a9,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
