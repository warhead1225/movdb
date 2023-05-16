import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/widgets/show_thumbnail.dart';

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Upcoming'),
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              ShowThumbnail(),
              ShowThumbnail(),
              ShowThumbnail(),
            ],
          ),
        ),
      ),
    );
  }
}