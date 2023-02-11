import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationUtils {
  static void navigateToView(BuildContext context, Widget view) {
    Navigator.push(
      context,
      PageTransition<PageTransition>(
        type: PageTransitionType.rightToLeft,
        child: view,
      ),
    );
  }
}