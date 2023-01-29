import 'package:classnet_app/course/widget/custom_list.dart';
import 'package:flutter/material.dart';

class OneCours extends StatelessWidget {
  const OneCours({super.key,
    required this.theme,
    required this.name,
    required this.image,
    required this.text,
  });

  final String theme;
  final String name;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Description du cours')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: CustomListItem(
                name: name,
                thumbnail: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topLeft,
                      image: AssetImage('assets/images/$image'),
                    ),
                  ),
                ),
                text: text,
                theme: theme,
                image: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


