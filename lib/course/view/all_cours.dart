import 'package:classnet_app/course/widget/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:classnet_app/model/hive/cours.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:classnet_app/model/hive/hive_config.dart';


class AllCours extends StatefulWidget {
  const AllCours({Key? key}) : super(key: key);

  @override
  State<AllCours> createState() => _AllCoursState();
}

class _AllCoursState extends State<AllCours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Cours>(HiveConfig.getHiveBoxes()).listenable(),
        builder: (context, Box<Cours> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text("No Cours"));
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemExtent: 140,
              itemBuilder: (context, index) {
                final result = box.getAt(index);
                final image  = result?.image;
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: CustomListItem(
                    name: result!.name,
                    thumbnail: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/$image'),
                        ),
                      ),
                    ),
                    theme: result.theme,
                    image: result.image,
                    text: result.text,
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
