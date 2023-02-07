import 'dart:convert';
import 'package:floor/floor.dart';

class IngredientConverter extends TypeConverter<Map<String, dynamic>, String>{
  @override
  Map<String, dynamic> decode(String databaseValue) {
    return jsonDecode(databaseValue);
  }

  @override
  String encode(Map<String, dynamic> value) {
    return jsonEncode(value);
  }

}