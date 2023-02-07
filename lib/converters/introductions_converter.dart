import 'dart:convert';
import 'package:floor/floor.dart';

class IntroductionsConverter extends TypeConverter<List<dynamic>, String>{
  @override
  List<dynamic> decode(String databaseValue) {
    return jsonDecode(databaseValue);
  }

  @override
  String encode(List<dynamic> value) {
    return jsonEncode(value);
  }

}