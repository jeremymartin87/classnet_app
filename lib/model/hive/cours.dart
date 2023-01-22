import 'package:hive_flutter/adapters.dart';



part 'cours.g.dart';


@HiveType(typeId: 1)
class Cours{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String theme;

  const Cours({
    required this.name,
    required this.theme,
  });

  String toString() {
    return '$name: $theme';
  }

  factory Cours.fromJson(dynamic map) {
    return Cours(
        name: map['id'] as String,
        theme: map['name'] as String);
  }
}
