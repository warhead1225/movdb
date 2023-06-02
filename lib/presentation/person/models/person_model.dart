import 'package:intl/intl.dart';

class PersonModel {
  final int id;
  final String name;
  final String bio;
  final int age;
  final String birthday;
  final String? placeOfBirth;
  final String? profilePath;

  PersonModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.age,
    required this.birthday,
    required this.placeOfBirth,
    required this.profilePath,
  });

  static PersonModel personObj(Map<String, dynamic> obj) {
    var formatter = DateFormat('MMM d, y');
    var yrFormatter = DateFormat('y');
    var birthday = (obj['birthday'] != null)
        ? formatter.format(DateTime.parse(obj['birthday']))
        : '';
    var age = (obj['birthday'] != null)
        ? DateTime.now().year -
            int.parse(yrFormatter.format(DateTime.parse(obj['birthday'])))
        : 0;

    return PersonModel(
      id: obj['id'],
      name: obj['name'],
      bio: obj['biography'],
      age: age,
      birthday: birthday,
      profilePath: obj['profile_path'] ?? 'xxxx',
      placeOfBirth: obj['place_of_birth'] ?? null,
    );
  }
}
