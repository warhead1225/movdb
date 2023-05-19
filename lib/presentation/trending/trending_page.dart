import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';
import 'package:movdb/presentation/trending/controller/TrendingController.dart';
import 'package:movdb/widgets/no_items_found.dart';
import 'package:movdb/widgets/show_thumbnail.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TrendingPage extends StatelessWidget {
  final TrendingModel? trending;
  TrendingPage({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendingController = Get.put(TrendingController());
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Trending'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 10),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => trendingController.pagingController.refresh()),
          child: PagedGridView<int, TrendingModel>(
            physics: BouncingScrollPhysics(),
            pagingController: trendingController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<TrendingModel>(
              itemBuilder: (context, item, index) =>
                  ShowThumbnail(trending: item),
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
