import 'package:classnet_app/course/widget/one_cours.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../boxes.dart';
import '../../model/hive/cours.dart';


class MyCoursDescription extends StatelessWidget {
  const MyCoursDescription({super.key,
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
    var cour = Cours(name: name,theme: theme,image: image,text: '');
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
              TextSpan(
                  style: const TextStyle(fontSize: 11,),
                  children: [
                    TextSpan(
                        text: name,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<Widget>(builder:
                                  (BuildContext context) {
                                return OneCours(theme: theme, name: name,
                                    image: image,text: text,);
                              }),
                            );
                          }
                    ),
                  ]
              )
          ),
          Text(
            theme,
            style: const TextStyle(fontSize: 10),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 9),
          ),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.blue.withOpacity(0.04);
                    }
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return Colors.blue.withOpacity(0.12);
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                  Boxes.DeleteMyCours(cour);
              },
              child: Text(AppLocalizations.of(context)?.delete ?? '')
          ),
        ],
      ),
    );
  }
}
