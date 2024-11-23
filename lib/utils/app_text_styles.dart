import 'package:flutter/material.dart';
import 'package:wish_list/utils/widget_size_utils.dart';

class AppTextStyles {
  const AppTextStyles._();
  static const double _lineHeight = 1.12;

  static TextStyle bodyText(BuildContext context) =>
      TextStyle(fontSize: widthSizer(16, context), height: _lineHeight);
  static TextStyle mediumBodyText(BuildContext context) =>
      TextStyle(fontSize: widthSizer(14, context), height: _lineHeight);
  static TextStyle smallBodyText(BuildContext context) =>
      TextStyle(fontSize: widthSizer(12, context), height: _lineHeight);

  static TextStyle heading1(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: widthSizer(40, context),
      height: 0.98);
  static TextStyle heading2(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: widthSizer(32, context),
      height: _lineHeight);
  static TextStyle heading3(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: widthSizer(24, context),
      height: _lineHeight);
  static TextStyle heading4(BuildContext context) => TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: widthSizer(18, context),
      height: _lineHeight);
}
