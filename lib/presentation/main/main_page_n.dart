import 'package:flutter/material.dart';

import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/main/controller/main_page_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ManPageN extends StatelessWidget {
  final mainPageController = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => mainPageController.onWillPop(),
      child: PersistentTabView(
        context,
        controller: mainPageController.persistentTabController,
        screens: mainPageController.swiperPages,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          colorBehindNavBar: ColorConstant.gray900,
        ),
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.blueGrey,
            title: 'Home',
            textStyle: AppStyle.txtRobotoRegular14NoShadow,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.movie_sharp),
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.blueGrey,
            title: 'Movies',
            textStyle: AppStyle.txtRobotoRegular14NoShadow,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.tv_sharp),
            activeColorPrimary: Colors.teal,
            inactiveColorPrimary: Colors.blueGrey,
            title: 'Tv Shows',
            textStyle: AppStyle.txtRobotoRegular14NoShadow,
          ),
        ],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => Get.toNamed(AppRoutes.searchPage),
          child: Icon(
            Icons.search_sharp,
            color: Colors.teal,
            size: 27,
          ),
        ),
      ),
    );
  }
}
