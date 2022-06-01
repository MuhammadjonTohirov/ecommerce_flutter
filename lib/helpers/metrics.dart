// import 'dart:html' as html;
import 'dart:ui' as ui;
// import 'dart:io' show Platform;

import 'package:ecommerce/helpers/global_methods.dart';
import 'package:flutter/material.dart';

class Design {
  static const double width = 2304;
  static const double height = 1400;

  static double get ratio => height / width;

  static double limitTop(double value, double limit) {
    if (value >= limit) {
      return limit;
    }

    return value;
  }

  static double widthByPercentage(double percentage) {
    double screenWidth = ui.window.physicalSize.width;
    return screenWidth * percentage / 100;
  }

  static double limitBottom(double value, double limit) {
    if (value < limit) {
      return limit;
    }

    return value;
  }

  static double responsiveWidth(double w) {
    double screenWidth = ui.window.physicalSize.width;
    appLog((w / Design.width) * screenWidth);
    var maxTop = limitTop((w / width) * screenWidth, w * 1.1);
    return limitBottom(maxTop, w * 0.9);
  }

  static double responsiveHeight(double h) {
    double screenWidth = ui.window.physicalSize.height;
    appLog((h / Design.width) * screenWidth);
    var maxTop = limitTop((h / width) * screenWidth, h * 1.1);
    return limitBottom(maxTop, h * 0.9);
  }
}

enum WidthType { large, medium, small }

WidthType widthType(double width) {
  if (width >= 1150) {
    return WidthType.large;
  }

  if (width >= 530 && width < 1150) {
    return WidthType.medium;
  }

  if (width < 530) {
    return WidthType.small;
  }

  return WidthType.small;
}

WidthType widthTypeWith(BuildContext context) {
  return widthType(MediaQuery.of(context).size.width);
}
