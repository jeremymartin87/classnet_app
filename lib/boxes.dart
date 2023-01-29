import 'dart:math' as math;

import 'package:hive_flutter/hive_flutter.dart';

import 'model/hive/my_cours.dart';
import 'model/hive/cours.dart';

class Boxes {
  static Box<Cours> get CoursBox => Hive.box<Cours>("courbox4");
  static Box<My_Cours> get MyCoursBox => Hive.box<My_Cours>("courbox6");

  static Future<void> initHive() async {
    await Hive.initFlutter();
    await openBoxes();
  }

  static Future<void> openBoxes() async {

    await Hive.openBox<Cours>("courbox4");
    await _generateCours(CoursBox);
  }

  static Future<void> AddMyCours(Cours cours) async {
    await Hive.openBox<My_Cours>("courbox6");
    await _AddToMyCours(MyCoursBox,cours);
  }
  static bool GetMyCours(Cours cours)  {
    return _GetMyCours(MyCoursBox,cours);
  }
  static Future<void> DeleteMyCours(Cours cours) async {
    await _DeleteMyCours(MyCoursBox,cours);
  }
  static Map<Box<dynamic>, dynamic Function(dynamic json)> get allBoxes => {
        CoursBox: (json) => Cours.fromJson(json),
      };

  static Future<void> _generateCours(Box<Cours> box) async {
    final numberValueExample = math.Random().nextInt(25545454).toString();
    final name = 'Customer$numberValueExample';
    final image = 'math.jpg';
    final theme = 'anglais';
    final text = "Bla bla bla bla bla bla bla bla bla";
    final cours = Cours(
      name: name,
      theme: theme,
      image: image,
      text: text,
    );
    if (box.values.isEmpty) {
      await box.put(DateTime.now().toString(),cours);
    }
  }
  static Future<void> _AddToMyCours(Box<My_Cours> box,Cours cours) async {
    final My_cours = My_Cours(
      cours: cours,
    );

    await box.put(DateTime.now().toString(),My_cours);
  }
  static Future<void> _DeleteMyCours(Box<My_Cours> box,Cours cours) async {
    for(int i = 0;box.length > i ;i++){
      if(box.getAt(i)?.cours.theme == cours.theme &&
          box.getAt(i)?.cours.name == cours.name &&
          box.getAt(i)?.cours.image == cours.image){
          await box.deleteAt(i);
      }
    }

  }
  static bool _GetMyCours(Box<My_Cours> box,Cours cours) {
    for(int i = 0;box.length > i ;i++){
        if(box.getAt(i)?.cours.theme == cours.theme &&
            box.getAt(i)?.cours.name == cours.name &&
            box.getAt(i)?.cours.image == cours.image){
          return true;
        }
    }
    return false;
  }

}
