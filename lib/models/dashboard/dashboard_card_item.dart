import 'package:ecommerce/helpers/media_provider.dart';
import 'package:flutter/material.dart';

class DashboardCardItem {
  final String title;
  String value;
  int percentage;
  bool status = false;
  int backgroundColor;

  String get percentageStr {
    return "$percentage %";
  }

  String? get perentageIcon => percentage > 0
      ? Media.iconArrowUp
      : (percentage == 0 ? null : Media.iconArrowDown);

  Color get percentageColor =>
      percentage >= 0 ? Colors.white : Color(0xFFEB5757);

  List<String> extras = [];

  DashboardCardItem(
      this.title, this.value, this.percentage, this.backgroundColor);
}
