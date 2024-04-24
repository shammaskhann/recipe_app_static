import 'dart:convert';

import 'package:flutter/services.dart';

class JsonServices {
  Future<List<dynamic>> loadRecipeData() async {
    String jsonString = await rootBundle.loadString('assets/data/recipe.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }
}
