import 'package:movdb/presentation/main/binding/main_page_binding.dart';
import 'package:movdb/presentation/main/main_page_n.dart';
import 'package:movdb/presentation/movies/movie_details_page.dart';
import 'package:movdb/presentation/person/person_page.dart';
import 'package:movdb/presentation/search_page/bindings/search_page_binding.dart';
import 'package:movdb/presentation/search_page/search_page.dart';
import 'package:movdb/presentation/splash_screen/splash_screen.dart';
import 'package:movdb/presentation/splash_screen/binding/splash_binding.dart';

import 'package:get/get.dart';
import 'package:movdb/presentation/top_rated_movies/binding/top_rated_movies_binding.dart';
import 'package:movdb/presentation/top_rated_movies/top_rated_movies_page.dart';
import 'package:movdb/presentation/top_rated_tv/binding/top_rated_tv_binding.dart';
import 'package:movdb/presentation/top_rated_tv/top_rated_tv_page.dart';
import 'package:movdb/presentation/trending/bindings/trending_binding.dart';
import 'package:movdb/presentation/trending/trending_page.dart';
import 'package:movdb/presentation/tv_shows/tv_shows_details.dart';
import 'package:movdb/presentation/upcoming/binding/upcoming_binding.dart';
import 'package:movdb/presentation/upcoming/upcoming_page.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String splashScreen = '/splash_screen';
  static const String mainPageN = '/main_page_n';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String movieDetails = '/movie_details';
  static const String tvDetails = '/tv_details';
  static const String trending = '/trending';
  static const String topRatedMovies = '/top_rated_movies';
  static const String topRatedTvseries = '/top_rated_tv_series';
  static const String UpComingMovies = '/upcoming_movies';
  static const String searchPage = '/search_page';
  static const String personPage = '/person_page';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: mainPageN,
      page: () => ManPageN(),
      bindings: [MainPageBinding()],
    ),
    GetPage(
      name: movieDetails,
      page: () => MovieDetailsPage(),
    ),
    GetPage(
      name: tvDetails,
      page: () => TvShowsDetails(),
    ),
    GetPage(
      name: trending,
      page: () => TrendingPage(),
      bindings: [TrendingBinding()],
    ),
    GetPage(
      name: topRatedMovies,
      page: () => TopRatedMoviesPage(),
      bindings: [TopRatedMoviesBinding()],
    ),
    GetPage(
      name: topRatedTvseries,
      page: () => TopRatedTvPage(),
      bindings: [TopRatedTvBinding()],
    ),
    GetPage(
      name: UpComingMovies,
      page: () => UpcomingPage(),
      bindings: [UpcomingBinding()],
    ),
    GetPage(
      name: searchPage,
      page: () => SearchPage(),
      bindings: [SearchPageBinding()],
    ),
    GetPage(
      name: personPage,
      page: () => PersonPage(),
    ),
  ];
}
