import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/search_page/controllers/search_controller.dart';
import 'package:movdb/presentation/search_page/models/search_model.dart';
import 'package:movdb/presentation/search_page/widgets/seach_text_field.dart';
import 'package:movdb/presentation/search_page/widgets/search_result_thumbnail.dart';
import 'package:movdb/widgets/no_items_found.dart';

class SearchPage extends StatelessWidget {
  final searchControler = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Search Movies/Tv Series'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: getPadding(all: 10),
        child: Column(
          children: [
            SearchTextField(controller: searchControler),
            Obx(
              () => (searchControler.searchText.value.isNotEmpty)
                  ? Expanded(
                      child: PagedGridView<int, SearchModel>(
                        physics: BouncingScrollPhysics(),
                        pagingController: searchControler.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<SearchModel>(
                          itemBuilder: (context, item, index) {
                            return item.posterPath != ''
                                ? SearchResultThumbnail(searchResult: item)
                                : SizedBox();
                          },
                          noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                            onPressed: () => null,
                            retry: false,
                          ),
                        ),
                        addAutomaticKeepAlives: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
