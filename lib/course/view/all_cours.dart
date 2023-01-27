import 'package:classnet_app/course/widget/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:classnet_app/model/hive/cours.dart';
import 'package:classnet_app/main.dart';
import 'package:hive_flutter/adapters.dart';


class AllCours extends StatefulWidget {
  const AllCours({Key? key}) : super(key: key);

  @override
  State<AllCours> createState() => _AllCoursState();
}

class _AllCoursState extends State<AllCours> {
  final _name = TextEditingController();
  final _theme = TextEditingController();
  final _image = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ValueListenableBuilder(
        valueListenable: Hive.box<Cours>('courbox2').listenable(),
        builder: (context, Box<Cours> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text("No Cours"));
          } else {

            return ListView.builder(
              itemCount: box.values.length,
              itemExtent: 140,
              itemBuilder: (context, index) {
                var result = box.getAt(index);
                var image  = result?.image;
                return Container(
                  padding: EdgeInsets.all(8.0),
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
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => addNewBook(context),
      ),
    );
  }

  addNewBook(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("New Cours"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _theme,
                  decoration: const InputDecoration(hintText: 'Thème'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _image,
                  decoration: const InputDecoration(hintText: 'Image'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await box!.put(
                          DateTime.now().toString(),
                          Cours(
                            name: _theme.text,
                            theme: _name.text,
                            image: _image.text,
                          ));

                      Navigator.pop(context);
                    },
                    child: const Text("Add")),
              ],
            ),
          );
        });
  }
}