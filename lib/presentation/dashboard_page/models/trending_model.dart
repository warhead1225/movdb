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
