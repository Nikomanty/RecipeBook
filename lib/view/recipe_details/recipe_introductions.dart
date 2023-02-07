import 'package:flutter/material.dart';
import 'package:recipe_book/widgets/containers/labeled_outline_box.dart';

class RecipeIntroductions extends StatelessWidget {
  final List<dynamic> introductions;

  const RecipeIntroductions({
    Key? key,
    required this.introductions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (introductions.isNotEmpty) {
      return LabeledOutlineBox(
        label: "Introductions",
        child: Column(
          children: introductions.map((introduction) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${introductions.indexOf(introduction) + 1}. ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Text.rich(TextSpan(text: introduction))),
                ],
              ),
            );
          }).toList(),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "No Intros found",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
