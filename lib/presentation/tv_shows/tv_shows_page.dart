import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/tv_shows/controller/tv_shows_controller.dart';
import 'package:movdb/presentation/tv_shows/models/tv_shows_model.dart';
import 'package:movdb/presentation/tv_shows/widgets/tv_shows_thumbnail.dart';
import 'package:movdb/widgets/no_items_found.dart';

class TvShowsPage extends StatelessWidget {
  final tvShowsController = Get.find<TvShowsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('TV Shows - Airing Today'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 10),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => tvShowsController.pagingController.refresh()),
          child: PagedGridView<int, TVShowsModel>(
            physics: BouncingScrollPhysics(),
            pagingController: tvShowsController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<TVShowsModel>(
              itemBuilder: (context, item, index) => TvShowsThumbnail(
                tvshow: item,
              ),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                onPressed: () => tvShowsController.pagingController.refresh(),
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
