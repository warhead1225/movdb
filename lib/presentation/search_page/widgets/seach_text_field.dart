import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/search_page/controllers/search_controller.dart';

class SearchTextField extends StatelessWidget {
  final SearchController controller;

  const SearchTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(bottom: 10),
      child: TextField(
        autocorrect: false,
        controller: controller.searchTextController,
        onChanged: (str) => controller.searchText.value = str,
        style: TextStyle(color: ColorConstant.whiteA700),
        decoration: InputDecoration(
          label: Text(
            'Movie/Series Title',
            style: AppStyle.txtRobotoRegular14,
          ),
          prefixIcon: Icon(
            Icons.search_sharp,
            color: ColorConstant.whiteA700,
          ),
          suffixIcon: IconButton(
            onPressed: () => controller.searchTextController.clear(),
            icon: Icon(
              Icons.clear_sharp,
              color: ColorConstant.whiteA700,
            ),
          ),
          focusedBorder: AppDecoration.inputBorderWhite,
          enabledBorder: OutlineInputBorder(
            gapPadding: 5,
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
