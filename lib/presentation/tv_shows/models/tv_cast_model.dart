class TvCastModel {
  final String name;
  final String profilePath;
  final String character;

  TvCastModel({
    required this.name,
    required this.profilePath,
    required this.character,
  });

  static TvCastModel movieCastObj(Map<String, dynamic> obj) {
    return TvCastModel(
      name: obj['name'],
      profilePath: obj['profile_path'] ?? '',
      character: obj['character'],
    );
  }
}
