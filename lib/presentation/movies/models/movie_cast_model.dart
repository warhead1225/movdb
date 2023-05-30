class MovieCastModel {
  final int id;
  final String name;
  final String profilePath;
  final String character;

  MovieCastModel({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  static MovieCastModel movieCastObj(Map<String, dynamic> obj) {
    return MovieCastModel(
      id: obj['id'],
      name: obj['name'],
      profilePath: obj['profile_path'] ?? '',
      character: obj['character'],
    );
  }
}
