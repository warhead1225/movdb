import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/models/upcoming_model.dart';
import 'package:movdb/presentation/upcoming/controller/upcoming_controller.dart';
import 'package:movdb/presentation/upcoming/widgets/upcoming_thumbnail.dart';
import 'package:movdb/widgets/no_items_found.dart';

class UpcomingPage extends StatelessWidget {
  final upcomingController = Get.find<UpcomingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Upcoming'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 5),
        child: RefreshIndicator(
          onRefresh: () =>
              Future.sync(() => upcomingController.pagingController.refresh()),
          child: PagedGridView<int, UpcomingModel>(
            physics: BouncingScrollPhysics(),
            pagingController: upcomingController.pagingController,
            builderDelegate: PagedChildBuilderDelegate<UpcomingModel>(
              itemBuilder: (context, item, index) =>
                  UpcomingThumbnail(upcoming: item),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                onPressed: () => upcomingController.pagingController.refresh(),
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
