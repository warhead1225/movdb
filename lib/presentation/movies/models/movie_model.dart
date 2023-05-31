class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
  });

  static MovieModel movieObj(Map<String, dynamic> obj) {
    return MovieModel(
      id: obj['id'],
      title: obj['title'] ?? obj['original_tite'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      backdropPath: obj['backdrop_path'] ?? 'xxxx',
      voteAverage: (obj["vote_average"].runtimeType is int)
          ? 0.0
          : double.parse(obj["vote_average"].toString()),
    );
  }
}
