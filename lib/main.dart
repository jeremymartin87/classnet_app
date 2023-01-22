import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

import 'course/view/all_cours.dart';
import 'model/hive/cours.dart';
import 'navbar/bottom_navbar.dart';

Box? box;
const darkModeBox = 'darkModeTutorial';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CoursAdapter());
  box = await Hive.openBox<Cours>("courbox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Classnet';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const AllCours(),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
