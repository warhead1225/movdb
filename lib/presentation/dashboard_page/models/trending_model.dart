class TrendingModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String mediaType;

  TrendingModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.voteAverage,
    required this.mediaType,
  });

  static TrendingModel trendingObj(Map<String, dynamic> obj) {
    return TrendingModel(
      id: obj['id'],
      title: (obj['media_type'] == 'movie')
          ? obj['title'] ?? obj['original_tite']
          : obj['name'] ?? obj['original_name'],
      overview: obj['overview'],
      posterPath: obj['poster_path'],
      backdropPath: obj['backdrop_path'],
      voteAverage: obj['vote_average'],
      mediaType: obj['media_type'],
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
      'media_type': this.mediaType,
    };
  }
}
