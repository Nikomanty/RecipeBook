import 'package:floor/floor.dart';
import 'package:recipe_book/converters/introductions_converter.dart';

@TypeConverters([ListConverter])
@entity
class Recipe {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String recipeName;
  final int duration;
  final List<dynamic> ingredients;
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
      : id = json['id'],
        recipeName = json['recipeName'],
        duration = json['duration'],
        ingredients = List.of(json['ingredients'])
            .map((e) => Ingredient.fromJson(e))
            .toList(),
        introductions = json['introductions'],
        image = json['image'];

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
      : ingredient = json['ingredient'],
        amount = json['amount'];

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient,
      'amount': amount,
    };
  }
}
