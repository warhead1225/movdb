import 'package:movdb/presentation/main/binding/main_page_binding.dart';
import 'package:movdb/presentation/main/main_page.dart';
import 'package:movdb/presentation/movies/binding/movie_details_binding.dart';
import 'package:movdb/presentation/movies/movie_details.dart';
import 'package:movdb/presentation/splash_screen/splash_screen.dart';
import 'package:movdb/presentation/splash_screen/binding/splash_binding.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String splashScreen = '/splash_screen';
  static const String mainPage = '/main_page';
  static const String dashboardPage = '/dashboard_page';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String movieDetails = '/movie_details';

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
      name: mainPage,
      page: () => MainPage(),
      bindings: [
        MainPageBinding(),
      ],
    ),
    GetPage(
      name: movieDetails,
      page: () => MovieDetails(),
      bindings: [
        MovieDetailsBinding(),
      ],
    ),
  ];
}