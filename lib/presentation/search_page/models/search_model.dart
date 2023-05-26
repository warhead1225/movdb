class SearchModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String mediaType;

  SearchModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.mediaType,
  });

  static SearchModel searcObj(Map<String, dynamic> obj) {
    return SearchModel(
      id: obj['id'],
      title: (obj['media_type'] == 'movie')
          ? obj['title'] ?? obj['original_tite']
          : obj['name'] ?? obj['original_name'],
      overview: obj['overview'] ?? '',
      posterPath: obj['poster_path'] ?? '',
      backdropPath: obj['backdrop_path'] ?? '',
      mediaType: obj['media_type'],
    );
  }
}
