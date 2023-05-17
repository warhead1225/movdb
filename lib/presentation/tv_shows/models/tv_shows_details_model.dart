class TvShowsDetailsModel {
  final String backDropPath;
  final List<dynamic> genres;
  final String originalLanguage;
  final String title;
  final String overView;
  final String posterPath;
  final String status;
  final double voteAverage;
  final String firstAirDate;

  TvShowsDetailsModel({
    required this.backDropPath,
    required this.genres,
    required this.originalLanguage,
    required this.title,
    required this.overView,
    required this.posterPath,
    required this.status,
    required this.voteAverage,
    required this.firstAirDate,
  });

  static TvShowsDetailsModel tvDetailObj(Map<String, dynamic> obj) {
    return TvShowsDetailsModel(
      backDropPath: obj['backdrop_path'] ?? '',
      genres: obj['genres'] ?? [],
      originalLanguage: obj['original_language'] ?? '',
      title: obj['title'] ?? obj['name'],
      overView: obj['overview'],
      posterPath: obj['poster_path'],
      status: obj['status'] ?? '',
      voteAverage: obj['vote_average'],
      firstAirDate: obj['first_air_date'],
    );
  }

  /* 
  {adult: false, backdrop_path: /qVNACrSwu8RCgf9loLKfTv0mDeq.jpg, created_by: [], episode_run_time: [],
   first_air_date: 2023-05-12, genres: [{id: 10765, name: Sci-Fi & Fantasy}, {id: 10759, name: Action & Adventure}, 
   {id: 18, name: Drama}], homepage: https://www.netflix.com/title/81195027, id: 137040, in_production: false, 
   languages: [ko, vi], last_air_date: 2023-05-12, last_episode_to_air: {id: 3925994, name: Episode 6, 
   overview: Confronted with a crisis, Seok executes his endgame. 5-8 and Seol-ah team up to stop Cheonmyeong once and for all., vote_average: 8.0, vote_count: 2, air_date: 2023-05-12, episode_number: 6, production_code: , runtime: 45, season_number: 1, show_id: 137040, still_path: /npYn0sTj0KAzBv4U9UmIAL9KSW9.jpg}, name: Black Knight, next_episode_to_air: null, networks: [{id: 213, logo_path: /wwemzKWzjKYJFfCeiB57q3r4Bcm.png, name: Netflix, origin_country: }], number_of_episodes: 6, number_of_seasons: 1, origin_country: [KR], original_language: ko, original_name: 택배기사, overview: In a dystopian 2071 devastated by air pollution, the survival of humanity depends on the Black Knights — and they’re far from your average delivery men., popularity: 303.094, poster_path: /5YvXX1sBJVZBF8DocLFq16Z0ABU.jpg, production_companies: [{id: 198745, logo_path: null, name: PROJECT318, origin_country: }], production_countries: [{iso_3166_1: KR, name: South Korea}], seasons: [{air_date: 2023-05-12, episode_count: 6, id: 216825, name: Season 1, overview: , poster_path: /sG4xgrzF52MkO6dr6auV8HaCDcV.jpg, season_number: 1}], spoken_languages: [{english_name: Korean, iso_639_1: ko, name: 한국어/조선말}, 
   {english_name: Vietnamese, iso_639_1: vi, name: Tiếng Việt}], 
  status: Ended, tagline: The one hope to overturn the world., type: Miniseries, vote_average: 7.652, vote_count: 55}
   */
}
