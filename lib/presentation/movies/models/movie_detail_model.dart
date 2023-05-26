class MovieDetailModel {
  final String backDropPath;
  final List<dynamic> genres;
  final String originalLanguage;
  final String title;
  final String overView;
  final String posterPath;
  final String status;
  final double voteAverage;
  final String releaseDate;

  MovieDetailModel({
    required this.backDropPath,
    required this.genres,
    required this.originalLanguage,
    required this.title,
    required this.overView,
    required this.posterPath,
    required this.status,
    required this.voteAverage,
    required this.releaseDate,
  });

  static MovieDetailModel movieDetailObj(Map<String, dynamic> obj) {
    return MovieDetailModel(
      backDropPath: obj['backdrop_path'] ?? '',
      genres: obj['genres'] ?? [],
      originalLanguage: obj['original_language'] ?? '',
      title: obj['title'] ?? obj['original_title'],
      overView: obj['overview'],
      posterPath: obj['poster_path'],
      status: obj['status'] ?? '',
      voteAverage: obj['vote_average'],
      releaseDate: obj['release_date'],
    );
  }

  /* {adult: false, backdrop_path: /n5NSF8wZeWQHHZtuWgbRAVpqXFR.jpg, belongs_to_collection: null, 
  budget: 0, genres: [{id: 28, name: Action}, {id: 53, name: Thriller}],
   homepage: https://www.netflix.com/title/80210920, id: 552688, imdb_id: tt6968614, original_language: en, original_title: The Mother, overview: A deadly female assassin comes out of hiding to protect the 
   daughter that she gave up years before, while on the run from dangerous men., popularity: 198.598, poster_path: /vnRthEZz16Q9VWcP5homkHxyHoy.jpg, production_companies: [{id: 829, logo_path: /mzpAmEQ5P1gFvdRoNyCk9q8ngiv.png, name: Vertigo Entertainment, origin_country: US}, {id: 1620, logo_path: null, name: Nuyorican Productions, origin_country: US}], production_countries: [{iso_3166_1: US, name: United States of America}], release_date: 2023-05-04, revenue: 0, runtime: 115, spoken_languages: [{english_name: English, iso_639_1: en, name: English}, {english_name: Ukrainian, iso_639_1: uk, name: Український}], 
  status: Released, tagline: , title: The Mother, video: false, vote_average: 6.855, vote_count: 255} */
}
