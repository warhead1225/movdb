class TopRatedMoviesModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;

  TopRatedMoviesModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
  });

  static TopRatedMoviesModel topRatedObj(Map<String, dynamic> obj) {
    return TopRatedMoviesModel(
      id: obj['id'],
      title: obj['title'] ?? obj['original_tite'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      backdropPath: obj['backdrop_path'],
      voteAverage: obj['vote_average'],
    );
  }
}
