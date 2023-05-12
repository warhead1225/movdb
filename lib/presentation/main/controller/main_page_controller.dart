import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movdb/presentation/dashboard_page/dashboard_page.dart';
import 'package:movdb/presentation/movies/movies_page.dart';
import 'package:movdb/presentation/trending/trending_page.dart';
import 'package:movdb/presentation/tv_shows/tv_shows_page.dart';
import 'package:movdb/presentation/upcoming/upcoming_page.dart';

class MainPageController extends GetxController {
  final swiperController = SwiperController();

  final swiperPages = <Widget>[
    DashboardPage(),
    MoviesPage(),
    TvShowsPage(),
    TrendingPage(),
    UpcomingPage(),
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
  /*  
    Movie List Now playing
    $response = $client->request('GET', 'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1', [
      'headers' => [
        'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTBkYjEyYTY3OWEwMTgwYmM5NGE3MTNhN2YwZjI5YiIsInN1YiI6IjY0NWIxNDMxMTU2Y2M3MDE1ZTc4MzAyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-b9TdDeJ94tMBg8MGF31HSEn_vc_RWcth4rY-040ItU',
        'accept' => 'application/json',
      ],
    ]);
    Genre
    $response = $client->request('GET', 'https://api.themoviedb.org/3/genre/movie/list?language=en', [
    'headers' => [
      'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTBkYjEyYTY3OWEwMTgwYmM5NGE3MTNhN2YwZjI5YiIsInN1YiI6IjY0NWIxNDMxMTU2Y2M3MDE1ZTc4MzAyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-b9TdDeJ94tMBg8MGF31HSEn_vc_RWcth4rY-040ItU',
      'accept' => 'application/json',
    ],
  ]);
  */
}
