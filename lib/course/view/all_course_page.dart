import 'package:flutter/material.dart';
import 'package:classnet_app/course/widget/custom_list.dart';

class ListCourse extends StatelessWidget {
  const ListCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          user: '',
          viewCount: 0,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.red),
          ),
          title: 'Test1',
        ),
        CustomListItem(
          user: '',
          viewCount: 0,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.green),
          ),
          title: 'test2',
        ),
      ],
    );
  }
}