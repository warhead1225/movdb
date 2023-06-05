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
      title: obj['name'] ?? obj['original_name'],
      overView: obj['overview'],
      posterPath: obj['poster_path'],
      status: obj['status'] ?? '',
      voteAverage: obj['vote_average'],
      firstAirDate: obj['first_air_date'] ?? '',
    );
  }
}
