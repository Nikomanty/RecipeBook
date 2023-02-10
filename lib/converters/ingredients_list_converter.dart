import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:recipe_book/model/recipe.dart';

class IngredientsListConverter extends TypeConverter<List<Ingredient>, String> {
  @override
  List<Ingredient> decode(String databaseValue) {
    final List<dynamic> jsonData = jsonDecode(databaseValue) as List<dynamic>;
    final List<Ingredient> convertedList = jsonData
        .map((ingredient) =>
            Ingredient.fromJson(ingredient as Map<String, dynamic>))
        .toList();
    return convertedList;
  }

  @override
  String encode(List<Ingredient> value) {
    return jsonEncode(value);
  }
}
