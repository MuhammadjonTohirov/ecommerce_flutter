import 'package:ecommerce/controllers/side_menu_controller.dart';
import 'package:ecommerce/database/short_storage.dart';
import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/screens/auth/auth_scene.dart';
import 'package:ecommerce/screens/home/home.dart';
import 'package:ecommerce/screens/launcher/launcher_scene.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(SideMenuController());
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  final _key = GlobalKey();
  MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  final DarkColors dark = DarkColors();
  final LightColors light = LightColors();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      theme: ThemeData(
        scaffoldBackgroundColor: light.background,
        dialogBackgroundColor: light.secondaryBackground,
        backgroundColor: light.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(color: light.icon),
        appBarTheme: AppBarTheme(
          foregroundColor: light.text,
          backgroundColor: light.secondaryBackground,
        ),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: light.text),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: light.primary,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: dark.secondaryBackground,
        dialogBackgroundColor: dark.secondaryBackground,
        iconTheme: IconThemeData(color: dark.icon),
        backgroundColor: dark.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          foregroundColor: dark.text,
          backgroundColor: dark.secondaryBackground,
        ),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: dark.text),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: ZoomPageTransitionsBuilder()
        }),
        primaryColor: dark.primary,
      ),
      home: LauncherScreen(),
    );
  }
}
