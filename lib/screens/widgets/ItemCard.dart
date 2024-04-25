import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/Favourite%20Controller/favourite_controller.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:food_recipe_app/resources/routes/routes_name.dart';
import 'package:food_recipe_app/resources/style/AppTextStyle.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  final Recipe recipe;
  const ItemCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = Get.find();
    List<Widget> stars = [];
    for (int i = 0; i < recipe.rating!.toInt(); i++) {
      stars.add(Icon(Icons.star,
          color: AppColors.primaryColor, size: Get.height * 0.015));
    }
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteName.detailRecipeScreen, arguments: recipe);
        },
        child: Container(
          width: Get.width * 0.6,
          child: Stack(
            children: [
              Container(
                width: Get.width * 0.55,
                decoration: BoxDecoration(
                  color: AppColors.tileColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (favouriteController
                              .isFavourite(recipe.recipeName!)) {
                            favouriteController.removeFavourite(recipe);
                          } else {
                            favouriteController.addFavoutire(recipe);
                          }
                        },
                        icon: Obx(
                          () => Icon(Icons.favorite_border_outlined,
                              color: (favouriteController
                                      .isFavourite(recipe.recipeName!)
                                  ? Colors.red
                                  : AppColors.greyColor)),
                        )),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, bottom: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipe.category ?? "Lunch",
                              style: AppTextStyle.categoryCard),
                          Text(
                            recipe.recipeName ?? "Recipe Name",
                            style: AppTextStyle.headingCard.copyWith(
                              fontSize: Get.height * 0.023,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(children: stars),
                          Text("${recipe.calories} Calories" ?? " 120 Calories",
                              style: AppTextStyle.caloriesCard),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time_outlined,
                                      color: AppColors.greyColor,
                                      size: Get.height * 0.025),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text("${recipe.makingTime} " ?? " 30 min",
                                      style: AppTextStyle.timeCard),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.fastfood_outlined,
                                      color: AppColors.greyColor,
                                      size: Get.height * 0.025),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${recipe.totalServing} Servings" ??
                                        " 2 Servings",
                                    style: AppTextStyle.timeCard,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Image.asset(
                    recipe.imageUrl ?? "assets/images/CaesarSalad.png",
                    height: Get.height * 0.15,
                    width: Get.width * 0.33,
                    alignment: Alignment.topLeft,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/CaesarSalad.png",
                    height: Get.height * 0.15,
                    width: Get.width * 0.33,
                    fit: BoxFit.fill,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
     // Positioned(
      //   child: Image.asset(recipe.imageUrl ?? "assets/images/CaesarSalad.png",
      //       height: Get.height * 0.1,
      //       width: Get.width * 0.2,
      //       fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
      //     return Image.asset(
      //       "assets/images/CaesarSalad.png",
      //       height: Get.height * 0.1,
      //       width: Get.width * 0.2,
      //       fit: BoxFit.cover,
      //     );
      //   }),
      // ),