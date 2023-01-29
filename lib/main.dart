import 'package:classnet_app/model/hive/my_cours.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'boxes.dart';

import 'course/view/all_cours.dart';
import 'model/hive/cours.dart';
import 'navbar/bottom_navbar.dart';

Box? box;
const darkModeBox = 'darkModeTutorial';
var darkMode = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CoursAdapter());
  Hive.registerAdapter(MyCoursAdapter());
  box = await Hive.openBox<Cours>("courbox4");
  box = await Hive.openBox<My_Cours>("courbox6");
  await Hive.openBox(darkModeBox);
  Boxes.initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  static const String _title = 'Classnet';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(darkModeBox).listenable(),
      builder: (context, box, widget) {
        darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: _title,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          home: Scaffold(
            appBar: AppBar(title: const Text(_title)),
            body: const AllCours(),
            bottomNavigationBar: NavBar(),
          ),
        );
      },
    );
  }
}
