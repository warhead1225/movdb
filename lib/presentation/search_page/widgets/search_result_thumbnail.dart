import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';
import 'package:movdb/presentation/search_page/models/search_model.dart';

class SearchResultThumbnail extends StatelessWidget {
  final SearchModel searchResult;

  const SearchResultThumbnail({Key? key, required this.searchResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        (searchResult.mediaType.toLowerCase() == 'movie')
            ? AppRoutes.movieDetails
            : AppRoutes.tvDetails,
        arguments: searchResult.id,
      ),
      child: Container(
        width: getHorizontalSize(150),
        margin: getMargin(right: 5, bottom: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageView(
              url: ApiHeaders.imageBase() + searchResult.posterPath,
              margin: getMargin(bottom: 5),
              height: getVerticalSize(175),
              width: getHorizontalSize(180),
              radius: BorderRadius.circular(10),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
            Tooltip(
              message: searchResult.title,
              child: Text(
                searchResult.title,
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
