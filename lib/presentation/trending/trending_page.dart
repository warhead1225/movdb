import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/trending/models/trending_model.dart';
import 'package:movdb/presentation/trending/controller/trending_controller.dart';
import 'package:movdb/widgets/no_items_found.dart';
import 'package:movdb/presentation/trending/widgets/trending_thumbnail.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TrendingPage extends StatelessWidget {
  final TrendingModel? trending;
  final trendingController = Get.find<TrendingController>();
  TrendingPage({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Trending Today'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 5),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => trendingController.pagingController.refresh()),
          child: PagedGridView<int, TrendingModel>(
            pagingController: trendingController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<TrendingModel>(
              itemBuilder: (context, item, index) =>
                  TrendingThumbnail(trending: item),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                onPressed: () => trendingController.pagingController.refresh(),
              ),
            ),
            addAutomaticKeepAlives: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
          ),
        ),
      ),
    );
  }
}
