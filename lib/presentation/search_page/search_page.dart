import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/search_page/controllers/search_controller.dart';
import 'package:movdb/presentation/search_page/models/search_model.dart';
import 'package:movdb/presentation/search_page/widgets/seach_text_field.dart';
import 'package:movdb/presentation/search_page/widgets/search_movtv_result_thumb.dart';
import 'package:movdb/presentation/search_page/widgets/search_person_result_thumb.dart';
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
        title: Text('Search'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: getPadding(all: 5),
        child: Column(
          children: [
            SearchTextField(
              controller: searchControler,
              clearSearch: () => searchControler.clearSearch(),
            ),
            Container(
              width: size.width,
              padding: getPadding(top: 5, bottom: 5),
              margin: getMargin(bottom: 10),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: getMargin(right: 5, left: 5),
                        child: OutlinedButton(
                          onPressed: () =>
                              searchControler.setSearchFilter(0, 'Movies'),
                          child: Text('Movies'),
                          style: (searchControler.searchFilterActive.value == 0)
                              ? AppStyle.searchActiveFilter
                              : AppStyle.searchInActiveFilter,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: getMargin(right: 5, left: 5),
                        child: OutlinedButton(
                          onPressed: () => searchControler.setSearchFilter(
                            1,
                            'Series',
                          ),
                          child: Text('Series'),
                          style: (searchControler.searchFilterActive.value == 1)
                              ? AppStyle.searchActiveFilter
                              : AppStyle.searchInActiveFilter,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: getMargin(right: 5, left: 5),
                        child: OutlinedButton(
                          onPressed: () =>
                              searchControler.setSearchFilter(2, 'People'),
                          child: Text('People'),
                          style: (searchControler.searchFilterActive.value == 2)
                              ? AppStyle.searchActiveFilter
                              : AppStyle.searchInActiveFilter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Search Results
            Obx(
              () => (searchControler.searchText.value.isNotEmpty)
                  ? Expanded(
                      child: PagedGridView<int, SearchModel>(
                        pagingController: searchControler.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<SearchModel>(
                          itemBuilder: (context, item, index) {
                            return (searchControler.searchFilterActive.value <
                                    2)
                                ? item.posterPath != ''
                                    ? SearchMovTvResultThumb(searchResult: item)
                                    : SizedBox()
                                : item.profilePath != ''
                                    ? SearchPersonResultThumb(
                                        searchResult: item,
                                      )
                                    : SizedBox();
                          },
                          noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                            onPressed: () => null,
                            retry: false,
                          ),
                        ),
                        scrollController: searchControler.scrollController,
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
