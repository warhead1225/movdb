import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/movies/controller/movies_controller.dart';
import 'package:movdb/presentation/movies/models/movie_model.dart';
import 'package:movdb/presentation/movies/widgets/movie_thumbnail.dart';
import 'package:movdb/widgets/no_items_found.dart';

class MoviesPage extends StatelessWidget {
  final movieController = Get.find<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Movies - Now Playing'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 5),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => movieController.pagingController.refresh()),
          child: PagedGridView<int, MovieModel>(
            physics: BouncingScrollPhysics(),
            pagingController: movieController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<MovieModel>(
              itemBuilder: (context, item, index) =>
                  MovieThumbnail(movie: item),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                onPressed: () => movieController.pagingController.refresh(),
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
