import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/search_page/models/search_model.dart';

class SearchShowController extends GetxController {
  final searchTextController = TextEditingController();
  final searchFocusNode = FocusNode();
  final int _numberOfPostsPerRequest = 10;
  final scrollController = ScrollController();

  var searchResultListObj = <SearchModel>[].obs;
  var pagingController = PagingController<int, SearchModel>(firstPageKey: 0);
  var searchText = ''.obs;
  var searchFilterActive = 0.obs;
  var searchLabel = 'Movies'.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(
      searchText,
      (_) => pagingController.refresh(),
      time: const Duration(milliseconds: 500),
    );
  }

  @override
  void onReady() {
    super.onReady();
    pagingController.addPageRequestListener((pageKey) => search(pageKey));
    scrollController.addListener(() {
      if (scrollController.offset >= 100) {
        searchFocusNode.unfocus();
        //Dismiss keyboard
        FocusScope.of(Get.context!).requestFocus(new FocusNode());
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    searchTextController.dispose();
    pagingController.dispose();
    searchFocusNode.dispose();
  }

  void search(int pageKey) async {
    searchResultListObj.clear();
    var ctr = 0;

    try {
      var searchResultlist = await ApiClient().search(
        page: pageKey,
        search: searchText.value,
        filter: searchFilterActive.value,
      );
      var isLastPage = searchResultlist.length < _numberOfPostsPerRequest;

      for (var searchResult in searchResultlist) {
        // do not put movie/series with incomplete details
        if ((searchFilterActive.value != 2 &&
                searchResult['poster_path'] != null) ||
            (searchFilterActive.value == 2 &&
                searchResult['profile_path'] != null)) {
          searchResultListObj.add(
            SearchModel.searchObj(
              searchResultlist[ctr],
              searchFilterActive.value,
            ),
          );
        }
        ctr++;
      }

      if (isLastPage) {
        pagingController.appendLastPage(searchResultListObj);
      } else {
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(searchResultListObj, nextPageKey);
      }
    } catch (e, s) {
      Logger.log(e, stackTrace: s);
    }
  }

  void clearSearch() {
    searchText.value = '';
    searchTextController.clear();
    searchFocusNode.unfocus();
  }

  //
  void setSearchFilter(int index, String label) {
    searchText.value = '';
    searchTextController.clear();
    searchFilterActive.value = index;
    searchLabel.value = label;
  }
}
