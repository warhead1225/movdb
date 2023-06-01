import 'package:intl/intl.dart';

class SearchModel {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;

  final int? personId;
  final String? name;
  final String? bio;
  final int? age;
  final String? birthday;
  final String? placeOfBirth;
  final String? profilePath;

  SearchModel({
    this.id,
    this.title,
    this.overview,
    this.backdropPath,
    this.posterPath,
    this.personId,
    this.name,
    this.age,
    this.bio,
    this.birthday,
    this.placeOfBirth,
    this.profilePath,
  });

  static SearchModel searchObj(
    Map<String, dynamic> obj,
    int searchFilter,
  ) {
    var isMovieTv = (searchFilter < 2) ? true : false;
    var age = 0;
    var birthday = '';

    if (!isMovieTv) {
      var formatter = DateFormat('MMM d, y');
      var yrFormatter = DateFormat('y');
      birthday = (obj['birthday'] != null)
          ? formatter.format(DateTime.parse(obj['birthday']))
          : '';
      age = (obj['birthday'] != null)
          ? DateTime.now().year -
              int.parse(yrFormatter.format(DateTime.parse(obj['birthday'])))
          : 0;
    }

    return (isMovieTv)
        ? SearchModel(
            id: obj['id'],
            title: (searchFilter == 0)
                ? obj['title'] ?? obj['original_tite']
                : obj['name'] ?? obj['original_name'],
            overview: obj['overview'] ?? '',
            posterPath: obj['poster_path'] ?? '',
            backdropPath: obj['backdrop_path'] ?? '',
          )
        : SearchModel(
            personId: obj['id'],
            name: obj['name'],
            bio: obj['biography'],
            age: age,
            birthday: birthday,
            profilePath: obj['profile_path'] ?? '',
            placeOfBirth: obj['place_of_birth'] ?? null,
          );
  }
}
