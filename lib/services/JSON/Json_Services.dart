import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_recipe_app/models/recipe_model.dart';

class JsonServices {
  Future<List<dynamic>> loadRecipeData() async {
    String jsonString = await rootBundle.loadString('assets/data/recipe.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData;
  }

  Future<List<Recipe>> getRecipeData() async {
    List<dynamic> jsonData = await loadRecipeData();
    List<Recipe> recipes = [];
    for (var item in jsonData) {
      recipes.add(Recipe.fromJson(item));
    }
    return recipes;
  }
}
