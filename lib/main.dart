import 'package:flutter/material.dart';
import 'package:recipe_book/res/recipe_book_strings.dart';
import 'package:recipe_book/views/recipe_book.dart';

void main() {
  runApp(MaterialApp(
    title: RecipeBookStrings.appTitle,
    home: RecipeBook(),
  ));
}
