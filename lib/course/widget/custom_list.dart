import 'package:flutter/material.dart';
import 'package:classnet_app/course/widget/course_description.dart';


class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.viewCount,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: CourseDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: const Text('ListTile')),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: thumbnail,
                          ),
                          Expanded(
                            flex: 3,
                            child: CourseDescription(
                              title: title,
                              user: user,
                              viewCount: viewCount,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
            child: Text(
              'go', //title
              textAlign: TextAlign.end,
            ),
          ),

        ],

      ),
    );

  }
}
