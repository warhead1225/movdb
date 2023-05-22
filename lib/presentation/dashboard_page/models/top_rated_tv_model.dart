class TopRatedTvModel {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;

  TopRatedTvModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });

  static TopRatedTvModel topRatedObj(Map<String, dynamic> obj) {
    return TopRatedTvModel(
      id: obj['id'],
      title: obj['name'],
      posterPath: obj['poster_path'],
      voteAverage: obj['vote_average'],
    );
  }
}
