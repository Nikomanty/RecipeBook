import 'dart:async';
import 'package:floor/floor.dart';
import 'package:recipe_book/converters/introductions_converter.dart';
import 'package:recipe_book/data/recipe_dao.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'recipe_database.g.dart';

@Database(version: 1, entities: [Recipe])
abstract class RecipeDatabase extends FloorDatabase{
  RecipeDao get recipeDao;
}
