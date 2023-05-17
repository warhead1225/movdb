class MovieVideosModel {
  final String name;
  final String key;
  final String site;

  MovieVideosModel({
    required this.name,
    required this.key,
    required this.site,
  });

  static MovieVideosModel movieVideosObj(Map<String, dynamic> obj) {
    return obj['name'] != null
        ? MovieVideosModel(
            name: obj['name'],
            key: obj['key'],
            site: obj['site'],
          )
        : MovieVideosModel(
            name: '',
            key: '',
            site: '',
          );
  }
}
