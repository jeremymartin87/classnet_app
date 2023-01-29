import 'package:classnet_app/course/widget/cours_description.dart';
import 'package:flutter/material.dart';


class CustomListItem extends StatelessWidget {
  const CustomListItem({
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
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: CoursDescription(
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
