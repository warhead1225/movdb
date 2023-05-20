class TopRatedTvModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;

  TopRatedTvModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
  });

  static TopRatedTvModel trendingObj(Map<String, dynamic> obj) {
    return TopRatedTvModel(
      id: obj['id'],
      title: obj['name'] ?? obj['original_name'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      backdropPath: obj['backdrop_path'],
      voteAverage: obj['vote_average'],
    );
  }

  Map<String, dynamic> topMap() {
    return {
      'id': this.id,
      'title': this.title,
      'overview': this.overview,
      'poster_path': this.posterPath,
      'backdrop_path': this.backdropPath,
      'vote_average': this.voteAverage,
    };
  }
}
