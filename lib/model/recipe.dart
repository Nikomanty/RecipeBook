import 'package:floor/floor.dart';
import 'package:recipe_book/converters/ingredient_converter.dart';
import 'package:recipe_book/converters/introductions_converter.dart';

@TypeConverters([IngredientConverter, IntroductionsConverter])
@entity
class Recipe {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String recipeName;
  final int duration;
  final Map<String, dynamic> ingredients;
  final List<dynamic> introductions;
  final String image;

  Recipe({
    this.id,
    required this.recipeName,
    required this.duration,
    required this.ingredients,
    required this.introductions,
    required this.image,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        recipeName = json['recipeName'],
        duration = json['duration'],
        ingredients = json['ingredients'],
        introductions = json['introductions'],
        image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'recipeName' : recipeName,
      'duration' : duration,
      'ingredients' : ingredients,
      'introductions' : introductions,
      'image' : image,
    };
  }


}
/*
class Ingredient {
  @primaryKey
  final String ingredient;
  final String amount;

  Ingredient({
    required this.ingredient,
    required this.amount,
  });
}
*/