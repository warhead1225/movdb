import 'dart:developer';

import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';

class ApiClient extends GetConnect {
  // Get trendng movies and tv series
  Future<List<dynamic>> getTrending({required int page}) async {
    // images:https://image.tmdb.org/t/p/original/
    // https://image.tmdb.org/t/p/w500/
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/trending/all/week?page=$page&language=en-US',
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

    return result;
  }

  //
  Future<List<dynamic>> getMovieVideos(int movieId) async {
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/movie/$movieId/videos',
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
  Future<List<dynamic>> getMovieCast(int movieId) async {
    var result = <dynamic>[];
    try {
      var response = await get(
        'https://api.themoviedb.org/3/movie/$movieId/credits',
        headers: ApiHeaders.authHeader(),
      );

      result =
          (!response.status.hasError) ? response.body['cast'] : <dynamic>[];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //
  Future<Map<String, dynamic>> getTvDetail(int tvId) async {
    var result = <String, dynamic>{};
    try {
      var response = await get(
        'https://api.themoviedb.org/3/tv/$tvId?language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      if (!response.status.hasError) {
        result = response.body['cast'];
      }
    } catch (e) {
      log(e.toString());
    }

    return result;
  }
}
