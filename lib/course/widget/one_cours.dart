import 'package:flutter/material.dart';
import 'package:classnet_app/course/widget/custom_list.dart';

class OneCours extends StatelessWidget {
  const OneCours({
    required this.theme,
    required this.name,
  });

  final String theme;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: CustomListItem(
                name: name,
                thumbnail: Container(
                  decoration: const BoxDecoration(color: Colors.red),
                ),
                theme: theme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


