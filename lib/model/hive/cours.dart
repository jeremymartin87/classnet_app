import 'package:hive_flutter/adapters.dart';



part 'cours.g.dart';


@HiveType(typeId: 1)
class Cours{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String theme;

  @HiveField(2)
  final String image;

  const Cours({
    required this.name,
    required this.theme,
    required this.image,
  });

  String toString() {
    return '$name: $theme';
  }

  factory Cours.fromJson(dynamic map) {
    return Cours(
        name: map['name'] as String,
        theme: map['theme'] as String,
        image: map['image'] as String);
  }
}
