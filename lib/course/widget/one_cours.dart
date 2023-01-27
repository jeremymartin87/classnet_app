import 'package:flutter/material.dart';
import 'package:classnet_app/course/widget/custom_list.dart';

class OneCours extends StatelessWidget {
  const OneCours({
    required this.theme,
    required this.name,
    required this.image,
  });

  final String theme;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                      image: AssetImage('assets/images/$image'),
                    ),
                  ),
                ),
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


