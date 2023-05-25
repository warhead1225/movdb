import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_client.dart';
import 'package:movdb/presentation/search_page/models/search_model.dart';

class SearchController extends GetxController {
  final searchTextController = TextEditingController();
  final searchFocusNode = FocusNode();
  final int _numberOfPostsPerRequest = 10;

  var searchResultListObj = <SearchModel>[];
  var pagingController = PagingController<int, SearchModel>(firstPageKey: 0);
  var searchText = ''.obs;

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
      var searchResultlist =
          await ApiClient().search(page: pageKey, search: searchText.value);
      var isLastPage = searchResultlist.length < _numberOfPostsPerRequest;

      for (var searchResult in searchResultlist) {
        // do not put movie/series with incomplete details
        if (searchResult['poster_path'] != null) {
          searchResultListObj.add(SearchModel.searcObj(searchResultlist[ctr]));
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
}
