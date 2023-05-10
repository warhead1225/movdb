import '../controller/dashboard_controller.dart';
import '../models/specials_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movdb/core/app_export.dart';

// ignore: must_be_immutable
class SpecialsItemWidget extends StatelessWidget {
  SpecialsItemWidget(this.specialsItemModelObj);

  SpecialsItemModel specialsItemModelObj;

  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 16,
          bottom: 1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgThumbnailimage143x901,
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
            Padding(
              padding: getPadding(
                left: 2,
                top: 2,
              ),
              child: RatingBar.builder(
                initialRating: 4,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemSize: getVerticalSize(
                  8,
                ),
                unratedColor: ColorConstant.blue50,
                itemCount: 5,
                updateOnDrag: true,
                onRatingUpdate: (rating) {},
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star,
                    color: ColorConstant.yellow700,
                  );
                },
              ),
            ),
            Padding(
              padding: getPadding(
                left: 2,
              ),
              child: Obx(
                () => Text(
                  specialsItemModelObj.titleTxt.value,
                  overflow: TextOverflow.ellipsis,
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
