import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/trending_model.dart';
import 'package:movdb/presentation/trending/controller/TrendingController.dart';
import 'package:movdb/widgets/show_thumbnail.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TrendingPage extends StatelessWidget {
  final TrendingModel? trending;
  final trendingController = Get.put(TrendingController());

  TrendingPage({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Trending'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 10),
        child: PagedGridView(
          pagingController: trendingController.pagingController,
          builderDelegate: PagedChildBuilderDelegate<ShowThumbnail>(
            itemBuilder: (context, item, index) => ShowThumbnail(imageUrl: ''),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}

/*  GridView.builder(
          itemCount: trendingController.trendingList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (c, i) => ShowThumbnail(
            imageUrl: trendingController.trendingList[i].posterPath,
          ),
        ), */
