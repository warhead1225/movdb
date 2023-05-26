import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/top_rated_movies_model.dart';
import 'package:movdb/presentation/top_rated_movies/controller/top_rated_movies_controller.dart';
import 'package:movdb/presentation/top_rated_movies/widgets/top_rated_movies_thumbnail.dart';
import 'package:movdb/widgets/no_items_found.dart';

class TopRatedMoviesPage extends StatelessWidget {
  final topRatedMovies = Get.find<TopRatedMoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Top Rated Movies'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 5),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => topRatedMovies.pagingController.refresh()),
          child: PagedGridView<int, TopRatedMoviesModel>(
            physics: BouncingScrollPhysics(),
            pagingController: topRatedMovies.pagingController,
            builderDelegate: PagedChildBuilderDelegate<TopRatedMoviesModel>(
              itemBuilder: (context, item, index) =>
                  TopRatedMoviesThumbnail(topRatedMovie: item),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                onPressed: () => topRatedMovies.pagingController.refresh(),
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
