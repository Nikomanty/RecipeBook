import 'dart:convert';
import 'package:floor/floor.dart';

class IntroductionConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    final List<dynamic> jsonData = jsonDecode(databaseValue) as List<dynamic>;
    final List<String> convertedList =
        jsonData.map((introduction) => introduction as String).toList();
    return convertedList;
  }

  @override
  String encode(List<String> value) {
    return jsonEncode(value);
  }
}
