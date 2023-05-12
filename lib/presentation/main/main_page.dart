import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movdb/presentation/main/controller/main_page_controller.dart';
import 'package:movdb/core/app_export.dart';

class MainPage extends StatelessWidget {
  final mainPageController = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      body: Swiper(
        controller: mainPageController.swiperController,
        itemCount: mainPageController.swiperPages.length,
        loop: false,
        physics: NeverScrollableScrollPhysics(),
        curve: Curves.easeInOut,
        itemBuilder: (context, index) => mainPageController.swiperPages[index],
      ),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: <IconData>[
            Icons.home,
            Icons.movie,
            Icons.tv,
            Icons.trending_up,
            Icons.upcoming,
          ],
          activeIndex: mainPageController.bottomNavBarActive.value,
          activeColor: Colors.cyan,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            mainPageController.bottomNavBarActive.value = index;
            mainPageController.swiperController.move(
              index,
            );
          },
        ),
      ),
    );
  }
}
