import 'package:ecommerce/controllers/side_menu_controller.dart';
import 'package:ecommerce/helpers/colors.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/helpers/metrics.dart';
import 'package:ecommerce/models/main/side_menu.dart';
import 'package:ecommerce/routers/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

// ignore: must_be_immutable
class HomeLeftMenu extends StatelessWidget {
  HomeLeftMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (a, frame) {
      return body(frame.maxWidth, context);
    });
  }

  Widget body(double width, BuildContext context) {
    return SafeArea(
      top: false,
      right: false,
      bottom: false,
      child: LayoutBuilder(builder: (a, frame) {
        return menus(context);
      }),
    );
  }

  Widget menus(BuildContext context) {
    WidthType type = widthType(MediaQuery.of(context).size.width);
    appLog(type);

    return Container(
      width: type == WidthType.small ? 50 : 150,
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).dialogBackgroundColor,
      child: GetX<SideMenuController>(builder: (controller) {
        return Column(
          children: controller.menuList
              .map(
                  (e) => e.body(context, controller.selectedMenu.value == e.id))
              .toList(),
        );
      }),
    );
  }
}
