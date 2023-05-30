import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class ContentLoading extends StatelessWidget {
  const ContentLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
