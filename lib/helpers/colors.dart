import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class Colorify {
  Color? background;
  Color? secondaryBackground;
  Color? tetriaryBackground;
  Color? primary;
  Color? text;
  Color? secondaryText;
  Color? icon;

  final Color? textGrey = Colors.grey;
}

class ColorPack {
  static final LightColors light = LightColors();
  static final DarkColors dark = DarkColors();

  static bool isDark() {
    return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  }

  static Color get background =>
      (isDark() ? dark.background : light.background)!;

  static Color get primary => (isDark() ? dark.primary : light.primary)!;

  static Color get secondaryBackground =>
      (isDark() ? dark.secondaryBackground : light.secondaryBackground)!;

  static Color get secondaryText =>
      (isDark() ? dark.secondaryText : light.secondaryText)!;

  // Color? tetriaryBackground;
  static Color get tetriaryBackground =>
      (isDark() ? dark.tetriaryBackground : light.tetriaryBackground)!;

  // Color? text;
  static Color get text => (isDark() ? dark.text : light.text)!;

  static Color get icon => (isDark() ? dark.icon : light.icon)!;

  static Color get textGrey => (isDark() ? dark.textGrey : light.textGrey)!;

  static final Color? red = Colors.redAccent;
}

class LightColors implements Colorify {
  @override
  Color? background = Color(0xFFFFFFFF);

  @override
  Color? primary = Color.fromARGB(255, 45, 156, 219);

  @override
  Color? secondaryBackground = Color(0xFFEFEFEF);

  @override
  Color? secondaryText = Color.fromARGB(255, 150, 150, 150);

  @override
  Color? tetriaryBackground = Color.fromARGB(255, 228, 228, 228);

  @override
  Color? text = Color(0xFF363636);

  @override
  Color? icon = Color(0xFF363636);

  @override
  Color? get textGrey => Colors.grey;
}

class DarkColors implements Colorify {
  @override
  Color? background = Color(0xFF363636);

  @override
  Color? primary = Color.fromARGB(255, 45, 156, 219);

  @override
  Color? secondaryBackground = Color.fromARGB(255, 65, 65, 65);

  @override
  Color? secondaryText = Color.fromARGB(255, 225, 225, 225);

  @override
  Color? tetriaryBackground = Color.fromARGB(255, 101, 101, 101);

  @override
  Color? text = Colors.white;

  @override
  Color? icon = Colors.white;

  @override
  Color? get textGrey => Colors.grey[400];
}
