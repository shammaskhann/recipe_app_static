import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/Favourite%20Controller/favourite_controller.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:food_recipe_app/resources/routes/routes_name.dart';
import 'package:food_recipe_app/resources/style/AppTextStyle.dart';
import 'package:get/get.dart';

class ItemCard2 extends StatelessWidget {
  final Recipe recipe;
  const ItemCard2({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = Get.find();
    List<Widget> stars = [];
    for (int i = 0; i < recipe.rating!.toInt(); i++) {
      stars.add(Icon(Icons.star,
          color: AppColors.primaryColor, size: Get.height * 0.015));
    }
    bool islongName = recipe.recipeName!.length > 15;
    return Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(RouteName.detailRecipeScreen, arguments: recipe);
          },
          child: Container(
            height: Get.height * 0.15,
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.tileColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      recipe.imageUrl ?? "assets/images/recipe1.png",
                      height: Get.height * 0.25,
                      width: Get.width * 0.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.category ?? "Lunch",
                        style: AppTextStyle.categoryCard,
                      ),
                      Text(
                        recipe.recipeName ?? "Recipe Name",
                        style: AppTextStyle.headingCard.copyWith(
                          fontSize:
                              islongName ? Get.width * 0.03 : Get.width * 0.04,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Row(children: stars),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${recipe.calories} Calories" ?? "120 Calories",
                            style: AppTextStyle.caloriesCard.copyWith(
                              fontSize: Get.width * 0.03,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined,
                              color: AppColors.greyColor,
                              size: Get.width * 0.03),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${recipe.makingTime}" ?? "30 Min",
                            style: AppTextStyle.timeCard,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.fastfood_outlined,
                              color: AppColors.greyColor,
                              size: Get.width * 0.03),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${recipe.totalServing} Servings" ?? "2 Servings",
                            style: AppTextStyle.timeCard,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Obx(
                          () => Icon(Icons.favorite_border_outlined,
                              color: (favouriteController
                                      .isFavourite(recipe.recipeName!)
                                  ? Colors.red
                                  : AppColors.greyColor)),
                        ),
                        onPressed: () {
                          if (favouriteController
                              .isFavourite(recipe.recipeName!)) {
                            favouriteController.removeFavourite(recipe);
                          } else {
                            favouriteController.addFavoutire(recipe);
                          }
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
