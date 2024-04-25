import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<Recipe> favouriteRecipes = <Recipe>[].obs;
  bool isFavourite(String recipeName) {
    for (var recipe in favouriteRecipes) {
      if (recipe.recipeName == recipeName) {
        return true;
      }
    }
    return false;
  }

  void addFavoutire(Recipe recipe) {
    favouriteRecipes.add(recipe);
  }

  void removeFavourite(Recipe recipe) {
    favouriteRecipes.remove(recipe);
    update();
  }
}
