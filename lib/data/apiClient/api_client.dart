import 'dart:developer';

import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';

class ApiClient extends GetConnect {
  // Get trendng movies and tv series
  Future<List<dynamic>> getTrending() async {
    //images:https://image.tmdb.org/t/p/original/
    //https://image.tmdb.org/t/p/w500/
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/trending/all/day?language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      if (!response.status.hasError) {
        result = response.body['results'];
      }
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get Top Rated Movies
  Future<List<dynamic>> getTopRatedMovies() async {
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1',
        headers: ApiHeaders.authHeader(),
      );

      if (!response.status.hasError) {
        result = response.body['results'];
      }
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get Top Rated Movies
  Future<List<dynamic>> getTopRatedSeries() async {
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=1',
        headers: ApiHeaders.authHeader(),
      );

      if (!response.status.hasError) {
        result = response.body['results'];
      }
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get upcoming
  Future<List<dynamic>> getUpcoming() async {
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1',
        headers: ApiHeaders.authHeader(),
      );

      if (!response.status.hasError) {
        result = response.body['results'];
      }
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //
  Future<Map<String, dynamic>> getMovieDetail(int movieId) async {
    var result = <String, dynamic>{};
    try {
      var response = await get(
        'https://api.themoviedb.org/3/movie/$movieId',
        headers: ApiHeaders.authHeader(),
      );

      if (!response.status.hasError) {
        result = response.body;
      }
    } catch (e) {
      //log error
      log(e.toString());
    }
    log(result.toString());
    return result;
  }
}