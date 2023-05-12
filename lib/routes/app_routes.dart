import 'package:movdb/presentation/dashboard_page/binding/dashboard_binding.dart';
import 'package:movdb/presentation/dashboard_page/dashboard_page.dart';
import 'package:movdb/presentation/main/binding/main_page_binding.dart';
import 'package:movdb/presentation/main/main_page.dart';
import 'package:movdb/presentation/splash_screen/splash_screen.dart';
import 'package:movdb/presentation/splash_screen/binding/splash_binding.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String mainPage = '/main_page';
  static const String dashboardPage = '/dashboard_page';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: dashboardPage,
      page: () => DashboardPage(),
      bindings: [
        DashBoardBinding(),
      ],
    ),
    GetPage(
      name: mainPage,
      page: () => MainPage(),
      bindings: [
        MainPageBinding(),
      ],
    )
  ];
}
