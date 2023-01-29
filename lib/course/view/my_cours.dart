import 'package:flutter/cupertino.dart';
import 'package:classnet_app/course/widget/my_custom_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:classnet_app/model/hive/my_cours.dart';

class Mycours extends StatefulWidget {
  const Mycours({Key? key}) : super(key: key);

  @override
  State<Mycours> createState() => _MycoursState();
}

class _MycoursState extends State<Mycours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<My_Cours>('courbox6').listenable(),
        builder: (context, Box<My_Cours> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text('Vide'));
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemExtent: 140,
              itemBuilder: (context, index) {
                var result = box.getAt(index);
                var image  = result?.cours.image;
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: MyCustomListItem(
                    name: result!.cours.name,
                    thumbnail: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/$image'),
                        ),
                      ),
                    ),
                    theme: result.cours.theme,
                    image: result.cours.image,
                    text: result.cours.text,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
