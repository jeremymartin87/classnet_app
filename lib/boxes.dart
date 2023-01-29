import 'package:classnet_app/model/hive/cours.dart';
import 'package:classnet_app/model/hive/my_cours.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
        CoursBox: Cours.fromJson,
      };

  static Future<void> _generateCours(Box<Cours> box) async {
    var name = 'math';
    var image = 'math.jpg';
    var theme = 'chap 1';
    var text = "Bla bla bla bla bla bla bla bla bla";
    var cours = Cours(
      name: name,
      theme: theme,
      image: image,
      text: text,
    );
    var name2 = 'angalais';
    var image2 = 'anglais.jpg';
    var theme2 = 'chap 1';
    var text2 = "cours d'anglais";
    var cours2 = Cours(
      name: name2,
      theme: theme2,
      image: image2,
      text: text2,
    );
    var name3 = 'communication';
    var image3 = 'com.jpg';
    var theme3 = 'chap 1';
    var text3 = "cours de communication";
    var cours3 = Cours(
      name: name3,
      theme: theme3,
      image: image3,
      text: text3,
    );
    var name4 = 'droit';
    var image4 = 'droit.jpg';
    var theme4 = 'theme 1';
    var text4 = "cours de droit";
    var cours4 = Cours(
      name: name4,
      theme: theme4,
      image: image4,
      text: text4,
    );
    var name5 = 'histoire';
    var image5 = 'histoire.jpg';
    var theme5 = 'theme 1';
    var text5 = "cours d' histoire";
    var cours5 = Cours(
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
    final MyCours = My_Cours(
      cours: cours,
    );

    await box.put(DateTime.now().toString(),MyCours);
  }
  static Future<void> _DeleteMyCours(Box<My_Cours> box,Cours cours) async {
    for(var i = 0;box.length > i ;i++){
      if(box.getAt(i)?.cours.theme == cours.theme &&
          box.getAt(i)?.cours.name == cours.name &&
          box.getAt(i)?.cours.image == cours.image){
          await box.deleteAt(i);
      }
    }

  }
  static bool _GetMyCours(Box<My_Cours> box,Cours cours) {
    for(var i = 0;box.length > i ;i++){
        if(box.getAt(i)?.cours.theme == cours.theme &&
            box.getAt(i)?.cours.name == cours.name &&
            box.getAt(i)?.cours.image == cours.image){
          return true;
        }
    }
    return false;
  }

}
