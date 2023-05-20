import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class TopRatedTvPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Top Rated Tv Series'),
      ),
      body: Container(
        width: size.width,
        padding: getPadding(all: 10),
        child: SizedBox(),
      ),
    );
  }
}
