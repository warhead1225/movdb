import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movdb/presentation/dashboard_page/dashboard_page.dart';
import 'package:movdb/presentation/movies/movies_page.dart';
import 'package:movdb/presentation/tv_shows/tv_shows_page.dart';

class MainPageController extends GetxController {
  final swiperController = SwiperController();

  final swiperPages = <Widget>[
    DashboardPage(),
    MoviesPage(),
    TvShowsPage(),
  ];

  var bottomNavBarActive = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void navPageChange(int index) {
    bottomNavBarActive.value = index;
    swiperController.move(index);
  }
}
