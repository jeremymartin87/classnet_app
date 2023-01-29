import 'package:classnet_app/course/widget/one_cours.dart';
import 'package:classnet_app/model/hive/cours.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:classnet_app/boxes.dart';




class CoursDescription extends StatelessWidget {
  const CoursDescription({
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
    print(text);
    Cours cour = Cours(name: name,theme: theme,image: image,text: "");
    String register = "Déjà ajouté";
    if(Boxes.GetMyCours(cour) == false){
      register = "Ajouter";
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(
              TextSpan(
                  style: TextStyle(fontSize: 12,),
                  children: [
                    TextSpan(
                        text: name,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<Widget>(builder: (BuildContext context) {
                                return OneCours(theme: theme, name: name,image: image,text: text);
                              }),
                            );
                          }
                    ),
                  ]
              )
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 0.0)),
          Text(
            theme,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 0.0)),
          Text(
            text,
            style: const TextStyle(fontSize: 8.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 0.0)),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.blue.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Colors.blue.withOpacity(0.12);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                if(Boxes.GetMyCours(cour) == false){
                  Boxes.AddMyCours(cour);
                }
              },
              child:
                Text(register)
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 0.0)),
        ],
      ),
    );
  }
}