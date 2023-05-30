class UpcomingModel {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final String? posterPath;
  final double voteAverage;

  UpcomingModel({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });

  static UpcomingModel upcomingModelObj(Map<String, dynamic> obj) {
    return UpcomingModel(
      id: obj['id'],
      title: obj['title'] ?? obj['original_tite'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      backdropPath: obj['backdrop_path'] ?? 'xxx',
      voteAverage: (obj["vote_average"].runtimeType is int)
          ? 0.0
          : double.parse(obj["vote_average"].toString()),
    );
  }
}
