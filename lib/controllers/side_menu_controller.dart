import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/helpers/media_provider.dart';
import 'package:ecommerce/models/main/side_menu.dart';
import 'package:ecommerce/routers/main_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  var selectedMenu = AppRouter.DashboardPageRoute.obs;
  var hoveringMenu = "".obs;

  var _menuList = [].obs;

  List<SideMenuItem> get menuList {
    return [..._menuList];
  }

  SideMenuController() {
    _menuList.add(
      SideMenuItem(AppRouter.DashboardPageRoute, "Dashboard", true,
          Media.iconDashboard2),
    );

    _menuList.add(SideMenuItem(
        AppRouter.ProductsPageRoute, "Sale Points", false, Media.iconMall));

    _menuList.add(SideMenuItem(AppRouter.WarehousesPageRoute, "Warehouses",
        false, Media.iconArrowDown));

    this.menuList.forEach((element) {
      element.onClick =
          (id) => {this.selectedMenu.value = id, appLog("On click $id")};
    });

    this.menuList.forEach((element) {
      element.onHovering =
          (id) => {this.hoveringMenu.value = id, appLog("On hover $id")};
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  SideMenuItem selectedMenuItem() {
    return menuList.firstWhere((element) => element.icon == selectedMenu.value);
  }

  SideMenuItem hoveringMenuItem() {
    return menuList.firstWhere((element) => element.icon == hoveringMenu.value);
  }

  selectMenu(String id) => selectedMenu.value = id;

  hoverMenu(String id) =>
      !this.isSelected(id) ? hoveringMenu.value = id : print("");

  isSelected(String id) => selectedMenu.value == id;

  isHovering(String id) => hoveringMenu.value == id;
}
