import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/search_page/controllers/search_controller.dart';
import 'package:movdb/presentation/search_page/models/search_model.dart';

class SearchPersonResultThumb extends StatelessWidget {
  final SearchModel searchResult;
  final controller = Get.find<SearchController>();

  SearchPersonResultThumb({Key? key, required this.searchResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRoutes.personPage,
        arguments: searchResult.personId,
      ),
      child: Container(
        width: getHorizontalSize(150),
        margin: getMargin(right: 5, bottom: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              url: ApiHeaders.imageBase() + searchResult.profilePath!,
              margin: getMargin(bottom: 5),
              height: getVerticalSize(175),
              width: getHorizontalSize(180),
              radius: BorderRadius.circular(10),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            Tooltip(
              message: searchResult.name,
              child: Text(
                searchResult.name!,
                style: AppStyle.txtRobotoRegular14,
                maxLines: 2,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
