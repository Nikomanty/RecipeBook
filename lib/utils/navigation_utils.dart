import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationUtils {
  static void openSelectedRecipe(BuildContext context, Widget child) {
    Navigator.push(
      context,
      PageTransition<PageTransition>(
        type: PageTransitionType.rightToLeft,
        child: child,
      ),
    );
  }
}