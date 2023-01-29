import 'package:classnet_app/course/widget/my_cours.dart';
import 'package:flutter/material.dart';


class MyCustomListItem extends StatelessWidget {
  const MyCustomListItem({
    super.key,
    required this.thumbnail,
    required this.theme,
    required this.name,
    required this.image,
    required this.text,
  });

  final Widget thumbnail;
  final String theme;
  final String name;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: MyCoursDescription(
              theme: theme,
              name: name,
              image: image,
              text: text,
            ),
          ),
        ],
      ),
    );

  }
}
