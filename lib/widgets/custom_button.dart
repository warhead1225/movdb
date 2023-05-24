// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movdb/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.margin,
    this.onTap,
    this.width,
    this.height,
    this.text,
    this.prefixWidget,
    this.suffixWidget,
  });

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    return prefixWidget != null || suffixWidget != null
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ])
        : Text(text ?? "", textAlign: TextAlign.center, style: _setFontStyle());
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll19:
        return getPadding(
          all: 19,
        );
      case ButtonPadding.PaddingT36:
        return getPadding(
          left: 29,
          top: 36,
          right: 29,
          bottom: 36,
        );
      default:
        return getPadding(
          top: 9,
          right: 9,
          bottom: 9,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillIndigo500:
        return ColorConstant.indigo500;
      case ButtonVariant.FillGray9007f:
        return ColorConstant.gray9007f;
      default:
        return ColorConstant.indigo500;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.FillIndigo500:
      case ButtonVariant.FillGray9007f:
        return null;
      default:
        return ColorConstant.black9003f;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.PaddingAll19:
        return null;
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.whiteA700A9,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.21,
          ),
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder3,
  PaddingAll19,
}

enum ButtonPadding {
  PaddingT9,
  PaddingAll19,
  PaddingT36,
}

enum ButtonVariant {
  OutlineBlack9003f,
  FillIndigo500,
  FillGray9007f,
}

enum ButtonFontStyle {
  RobotoRegular14WhiteA700a9,
}
