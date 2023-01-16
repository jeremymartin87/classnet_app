import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:io';

//part 'main.g.dart';

const darkModeBox = 'darkModeTutorial';

@HiveType(typeId: 0)
class Cour extends HiveObject {

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String theme;

}

void main() async {
  var path = Directory.current.path;
  Hive
    ..init(path);
    //..registerAdapter(CourAdapter());

  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);

  //var box = await Hive.openBox('testBox');

  //box.put('name', 'Math');

  //var name = box.get('name');

  //print('Name: $name');

  //print('Name: ${box.get('name')}');

  var box = await Hive.openBox('myBox');

  var cour = Cour()
    ..name = 'Math'
    ..theme = 'Chap1';
  box.add(cour);

  cour.save();
  print(box.getAt(0));

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(darkModeBox).listenable(),
      builder: (context, box, widget) {
        var darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          home: Scaffold(
            appBar: AppBar(
              title: Text("Test"),
            ),
            body: Center(
              child: Switch(
                value: darkMode,
                onChanged: (val) {
                  box.put('darkMode', !darkMode);
                },
              ),
            ),
          ),

        );
      },
    );
  }
}