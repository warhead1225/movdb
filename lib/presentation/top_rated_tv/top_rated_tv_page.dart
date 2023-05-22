import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_tv_model.dart';
import 'package:movdb/presentation/top_rated_tv/controller/top_rated_tv_controller.dart';
import 'package:movdb/presentation/top_rated_tv/widgets/top_rated_tv_thumbnal.dart';
import 'package:movdb/widgets/no_items_found.dart';

class TopRatedTvPage extends StatelessWidget {
  final topRatedTv = Get.find<TopRatedTvController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Top Rated Tv Series'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 10),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => topRatedTv.pagingController.refresh()),
          child: PagedGridView<int, TopRatedTvModel>(
            physics: BouncingScrollPhysics(),
            pagingController: topRatedTv.pagingController,
            builderDelegate: PagedChildBuilderDelegate<TopRatedTvModel>(
              itemBuilder: (context, item, index) =>
                  TopRatedTvThumbnail(topRatedTv: item),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                onPressed: () => topRatedTv.pagingController.refresh(),
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
