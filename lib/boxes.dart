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
    String name = 'math';
    String image = 'math.jpg';
    String theme = 'chap 1';
    String text = "Bla bla bla bla bla bla bla bla bla";
    Cours cours = Cours(
      name: name,
      theme: theme,
      image: image,
      text: text,
    );
    String name2 = 'angalais';
    String image2 = 'anglais.jpg';
    String theme2 = 'chap 1';
    String text2 = "cours d'anglais";
     Cours cours2 = Cours(
      name: name2,
      theme: theme2,
      image: image2,
      text: text2,
    );
    String name3 = 'communication';
    String image3 = 'com.jpg';
    String theme3 = 'chap 1';
    String text3 = "cours de communication";
    Cours cours3 = Cours(
      name: name3,
      theme: theme3,
      image: image3,
      text: text3,
    );
    String name4 = 'droit';
    String image4 = 'droit.jpg';
    String theme4 = 'theme 1';
    String text4 = "cours de droit";
    Cours cours4 = Cours(
      name: name4,
      theme: theme4,
      image: image4,
      text: text4,
    );
    String name5 = 'histoire';
    String image5 = 'histoire.jpg';
    String theme5 = 'theme 1';
    String text5 = "cours d' histoire";
    Cours cours5 = Cours(
      name: name5,
      theme: theme5,
      image: image5,
      text: text5,
    );

    if (box.values.isEmpty) {
      await box.put(DateTime.now().toString(),cours);
      await box.put(DateTime.now().toString(),cours2);
      await box.put(DateTime.now().toString(),cours3);
      await box.put(DateTime.now().toString(),cours4);
      await box.put(DateTime.now().toString(),cours5);
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
