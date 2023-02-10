import 'package:floor/floor.dart';
import 'package:recipe_book/converters/ingredients_list_converter.dart';
import 'package:recipe_book/converters/introductions_converter.dart';

@TypeConverters([IntroductionConverter, IngredientsListConverter])
@entity
class Recipe {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String recipeName;
  final int duration;
  final List<Ingredient> ingredients;
  final List<String> introductions;
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
      : id = json['id'] as int,
        recipeName = json['recipeName'] as String,
        duration = json['duration'] as int,
        ingredients = List.of(json['ingredients'] as List<Ingredient>)
            .map((ingredient) =>
                Ingredient.fromJson(ingredient as Map<String, dynamic>))
            .toList(),
        introductions = json['introductions'] as List<String>,
        image = json['image'] as String;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipeName': recipeName,
      'duration': duration,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'introductions': introductions,
      'image': image,
    };
  }
}

class Ingredient {
  String ingredient;
  String amount;

  Ingredient({
    required this.ingredient,
    required this.amount,
  });

  Ingredient.fromJson(Map<String, dynamic> json)
      : ingredient = json['ingredient'] as String,
        amount = json['amount'] as String;

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient,
      'amount': amount,
    };
  }
}
