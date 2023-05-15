class UpcomingModel {
  final int id;
  final String backdropPath;
  final String title;
  final String overview;
  final String posterPath;
  final List<dynamic> genreId;
  final double voteAverage;

  UpcomingModel({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.genreId,
    required this.voteAverage,
  });
}
