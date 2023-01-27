import 'package:classnet_app/course/widget/one_cours.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';




class CoursDescription extends StatelessWidget {
  const CoursDescription({
    required this.theme,
    required this.name,
    required this.image,
  });

  final String theme;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
              TextSpan(
                  style: TextStyle(fontSize: 14,),
                  children: [
                    TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: name,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<Widget>(builder: (BuildContext context) {
                                return OneCours(theme: theme, name: name,image: image);
                              }),
                            );
                          }
                    ),
                  ]
              )
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            theme,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}