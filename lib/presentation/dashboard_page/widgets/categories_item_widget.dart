import '../controller/dashboard_controller.dart';
import '../models/categories_item_model.dart';
import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

// ignore: must_be_immutable
class CategoriesItemWidget extends StatelessWidget {
  CategoriesItemWidget(this.categoriesItemModelObj,
      {this.onTapImgCategorythumbnail});

  CategoriesItemModel categoriesItemModelObj;

  var controller = Get.find<DashboardController>();

  VoidCallback? onTapImgCategorythumbnail;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: getVerticalSize(
          30,
        ),
        width: getHorizontalSize(
          90,
        ),
        margin: getMargin(
          right: 16,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgCategorythumbnail30x90,
              height: getVerticalSize(
                30,
              ),
              width: getHorizontalSize(
                90,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  2,
                ),
              ),
              alignment: Alignment.center,
              onTap: () {
                onTapImgCategorythumbnail?.call();
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: getPadding(
                  right: 20,
                ),
                child: Obx(
                  () => Text(
                    categoriesItemModelObj.typeTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRegular14.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
