import 'dart:developer';

import 'package:movdb/core/app_export.dart';
import 'package:movdb/data/apiClient/api_headers.dart';

class ApiClient extends GetConnect {
  // Get trendng movies and tv series
  Future<List<dynamic>> getTrending({required int page}) async {
    var result = <dynamic>[];
    page = page + 1;
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}trending/all/day?page=$page&language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get Top Rated Movies
  Future<List<dynamic>> getNowPlayingMovies({required int page}) async {
    var result = <dynamic>[];
    page = page + 1;
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}movie/now_playing?page=$page&language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get Top Rated Movies
  Future<List<dynamic>> getTopRatedMovies({required int page}) async {
    var result = <dynamic>[];
    page = page + 1;
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}movie/top_rated?page=$page&language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //
  Future<List<dynamic>> getAiringSeries({required int page}) async {
    var result = <dynamic>[];
    page = page + 1;
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}tv/airing_today?page=$page&language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get Top Rated Movies
  Future<List<dynamic>> getTopRatedSeries({required int page}) async {
    var result = <dynamic>[];
    page = page + 1;
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}tv/top_rated?page=$page&language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Get upcoming
  Future<List<dynamic>> getUpcoming({required int page}) async {
    var result = <dynamic>[];
    page = page + 1;
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}movie/upcoming?language=en-US&page=$page',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
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
        '${dotenv.env['API_BASE']}movie/$movieId',
        headers: ApiHeaders.authHeader(),
      );

      result =
          (!response.status.hasError) ? response.body : <String, dynamic>{};
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //
  Future<List<dynamic>> getMovieVideos(int movieId) async {
    var result = [];
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}movie/$movieId/videos',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
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
        '${dotenv.env['API_BASE']}movie/$movieId/credits',
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
        '${dotenv.env['API_BASE']}tv/$tvId?language=en-US',
        headers: ApiHeaders.authHeader(),
      );

      result =
          (!response.status.hasError) ? response.body : <String, dynamic>{};
    } catch (e) {
      log(e.toString());
    }

    return result;
  }

  //
  Future<List<dynamic>> getTvCast(int seriesId, int seasonNumber) async {
    var result = <dynamic>[];
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}tv/$seriesId/season/$seasonNumber/credits',
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

  //Search movies and Tv series
  Future<List<dynamic>> search({
    required int page,
    required String search,
  }) async {
    var result = [];
    search = search.trim().toLowerCase();
    page = page + 1;

    try {
      var response = await get(
        '${dotenv.env['API_BASE']}search/multi?query=$search&include_adult=false&language=en-US&page=$page',
        headers: ApiHeaders.authHeader(),
      );

      result = (!response.status.hasError) ? response.body['results'] : [];
    } catch (e) {
      //log error
      log(e.toString());
    }

    return result;
  }

  //Artist Detail
  Future<Map<String, dynamic>> getPersonBio(int personId) async {
    var result = <String, dynamic>{};
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}person/$personId',
        headers: ApiHeaders.authHeader(),
      );

      result =
          (!response.status.hasError) ? response.body : <String, dynamic>{};
    } catch (e) {
      log(e.toString());
    }

    return result;
  }

  //Artist Movies
  Future<List<dynamic>> getPersonMovies(int personId) async {
    var result = <dynamic>[];
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}person/$personId/movie_credits',
        headers: ApiHeaders.authHeader(),
      );

      result =
          (!response.status.hasError) ? response.body['cast'] : <dynamic>[];
    } catch (e) {
      log(e.toString());
    }

    return result;
  }

  //Artis Tv-Shows
  Future<List<dynamic>> getPersonTvShows(int personId) async {
    var result = <dynamic>[];
    try {
      var response = await get(
        '${dotenv.env['API_BASE']}person/$personId/tv_credits',
        headers: ApiHeaders.authHeader(),
      );

      result =
          (!response.status.hasError) ? response.body['cast'] : <dynamic>[];
    } catch (e) {
      log(e.toString());
    }

    return result;
  }
}
