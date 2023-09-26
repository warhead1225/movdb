class TVShowsModel {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;

  TVShowsModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });

  static TVShowsModel tvShowsObj(Map<String, dynamic> obj) {
    return TVShowsModel(
      id: obj['id'],
      title: obj['name'] ?? obj['original_name'],
      posterPath: obj['poster_path'] ?? '',
      voteAverage: (obj['vote_average'].runtimeType is int)
          ? 0.0
          : double.parse(obj['vote_average'].toString()),
    );
  }
}
