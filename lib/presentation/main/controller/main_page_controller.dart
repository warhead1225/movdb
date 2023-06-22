import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:movdb/core/app_export.dart';
import 'package:movdb/presentation/dashboard_page/dashboard_page.dart';
import 'package:movdb/presentation/movies/movies_page.dart';
import 'package:movdb/presentation/tv_shows/tv_shows_page.dart';
import 'package:movdb/widgets/alert_dialog_container.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPageController extends GetxController {
  final swiperController = SwiperController();
  final swiperPages = <Widget>[
    DashboardPage(),
    MoviesPage(),
    TvShowsPage(),
  ];

  late StreamSubscription<ConnectivityResult> connectionSubscription;

  var bottomNavBarActive = 0.obs;
  var _hasInternetConnection = true.obs;

  final persistentTabController = PersistentTabController(initialIndex: 0);

  @override
  void onReady() {
    super.onReady();
    swiperController.move(2, animation: false);

    connectionSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) => _connectionListener(result));
  }

  void _connectionListener(ConnectivityResult r) async {
    if (r == ConnectivityResult.none) {
      SnackBarUtil.showSnackBar(
        title: 'No Internet connection',
        message: 'You are currently offline',
      );
      _hasInternetConnection.value = false;
    } else {
      if (!_hasInternetConnection.value) {
        SnackBarUtil.showSnackBar(
          title: 'Internet connection',
          message: 'Internet connection was restored',
        );
        _hasInternetConnection.value = true;
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    connectionSubscription.cancel();
  }

  void navPageChange(int index) {
    bottomNavBarActive.value = index;
    swiperController.move(index);
  }

  Future<bool> onWillPop() async {
    if (bottomNavBarActive.value == 0) {
      showCupertinoDialog(
        context: Get.context!,
        builder: (context) => AlertDialogContainer(
          'Exit Application?',
          'Are you sure you want to exit the application?',
          'NO',
          () {
            Get.back();
          },
          'YES',
          () => SystemNavigator.pop(),
        ),
      );
    } else {
      navPageChange(0);
    }

    return false;
  }
}
