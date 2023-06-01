import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/search_page/controllers/search_controller.dart';

class SearchTextField extends StatelessWidget {
  final SearchController controller;
  final VoidCallback clearSearch;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.clearSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(bottom: 10),
      child: TextField(
        autocorrect: false,
        controller: controller.searchTextController,
        onChanged: (str) => controller.searchText.value = str,
        onSubmitted: (str) => controller.searchText.value = str,
        style: TextStyle(color: ColorConstant.whiteA700),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_sharp,
            color: ColorConstant.whiteA700,
          ),
          suffixIcon: IconButton(
            onPressed: () => clearSearch(),
            icon: Icon(
              Icons.clear_sharp,
              color: ColorConstant.whiteA700,
            ),
          ),
          focusedBorder: AppDecoration.inputBorderWhite,
          enabledBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: getPadding(all: 3),
          label: Obx(
            () => Text(
              'Search for ${controller.searchLabel.value}',
              style: AppStyle.txtRobotoRegular14,
            ),
          ),
        ),
      ),
    );
  }
}
