import 'package:movdb/core/app_export.dart';

class ApiClient extends GetConnect {
  Future<Map<String, dynamic>> getTrending() async {
    //images : https://image.tmdb.org/t/p/original/
    // https://image.tmdb.org/t/p/w500/
    final response = await get(
        'https://api.themoviedb.org/3/trending/all/day?language=en-US',
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTBkYjEyYTY3OWEwMTgwYmM5NGE3MTNhN2YwZjI5YiIsInN1YiI6IjY0NWIxNDMxMTU2Y2M3MDE1ZTc4MzAyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-b9TdDeJ94tMBg8MGF31HSEn_vc_RWcth4rY-040ItU',
          'Accept': 'application/json'
        });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
