class ApiHeaders {
  static String imageBase() => 'https://image.tmdb.org/t/p/original/';

  static Map<String, String> authHeader() {
    return {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTBkYjEyYTY3OWEwMTgwYmM5NGE3MTNhN2YwZjI5YiIsInN1YiI6IjY0NWIxNDMxMTU2Y2M3MDE1ZTc4MzAyNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-b9TdDeJ94tMBg8MGF31HSEn_vc_RWcth4rY-040ItU',
      'Accept': 'application/json',
    };
  }
}
