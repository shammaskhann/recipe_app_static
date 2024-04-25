import 'dart:developer';

import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/services/JSON/Json_Services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  JsonServices jsonServices = JsonServices();
  List<Recipe> recipes = [];

  @override
  void onInit() {
    super.onInit();
    getAllRecipes();
  }

  Future<List<Recipe>> getFreshRecipes() async {
    List<Recipe> recipes = await jsonServices.getRecipeData();
    //check for the tag 'fresh' in the recipe
    try {
      List<Recipe> freshRecipes = [];
      for (var recipe in recipes) {
        if (recipe.tags == 'Fresh') {
          freshRecipes.add(recipe);
        }
      }
      //log(freshRecipes.toString());
      return freshRecipes;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> getAllRecipes() async {
    recipes = await jsonServices.getRecipeData();
  }

  Future<List<Recipe>> getRecommendedRecipes() async {
    List<Recipe> recipes = await jsonServices.getRecipeData();
    //check for the tag 'popular' in the recipe
    try {
      // ignore: non_constant_identifier_names
      List<Recipe> RecommendedRecipes = [];
      for (var recipe in recipes) {
        if (recipe.tags == 'Recommended') {
          RecommendedRecipes.add(recipe);
        }
      }
      return RecommendedRecipes;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
