import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class AppbarImage extends StatelessWidget {
  final double height;
  final double width;
  final String? imagePath;
  final String? svgPath;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  AppbarImage({
    required this.height,
    required this.width,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
