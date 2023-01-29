import 'package:classnet_app/model/hive/cours.dart';
import 'package:hive_flutter/adapters.dart';



part 'my_cours.g.dart';


@HiveType(typeId: 2)
class My_Cours{


  @HiveField(0)
  final Cours cours;

  const My_Cours({
    required this.cours,
  });
}
