import 'package:flutter/material.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:food_recipe_app/resources/style/AppTextStyle.dart';
import 'package:food_recipe_app/screens/widgets/CustomButton.dart';
import 'package:get/get.dart';

class DetailRecipeScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailRecipeScreen({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 35.0, left: 15, bottom: 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.star,
                        color: AppColors.whiteColor, size: 20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(recipe.recipeName ?? "Recipe Name",
                style: AppTextStyle.headingCard.copyWith(
                  fontSize: Get.height * 0.04,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(recipe.category ?? "Lunch",
                style: AppTextStyle.categoryCard.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.height * 0.04,
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Calories",
                      style: AppTextStyle.subtext.copyWith(
                        color: AppColors.greyColor,
                        fontSize: Get.width * 0.04,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("${recipe.calories} Calories" ?? "0",
                        style: AppTextStyle.caloriesCard.copyWith(
                          color: AppColors.blackColor,
                          fontSize: Get.width * 0.05,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    //time
                    Text(
                      "Time",
                      style: AppTextStyle.subtext.copyWith(
                        color: AppColors.greyColor,
                        fontSize: Get.width * 0.04,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    Text("${recipe.makingTime} " ?? " 30 min",
                        style: AppTextStyle.caloriesCard.copyWith(
                          color: AppColors.blackColor,
                          fontSize: Get.width * 0.05,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    //serving
                    Text(
                      "Total Serve",
                      style: AppTextStyle.subtext.copyWith(
                        color: AppColors.greyColor,
                        fontSize: Get.width * 0.04,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("${recipe.totalServing} Servings" ?? " 2 Servings",
                        style: AppTextStyle.caloriesCard.copyWith(
                          color: AppColors.blackColor,
                          fontSize: Get.width * 0.05,
                        )),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.3,
                      width: Get.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(recipe.imageUrl ?? ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Description",
                style: AppTextStyle.caloriesCard.copyWith(
                  color: AppColors.blackColor,
                  fontSize: Get.width * 0.05,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              recipe.recipeDescription ?? "Description",
              style: AppTextStyle.subtext.copyWith(
                color: AppColors.greyColor,
                fontSize: Get.height * 0.02,
              ),
              maxLines: Get.height.toInt() ~/ 20,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomButton(
                  height: Get.height * 0.07,
                  width: Get.width * 0.9,
                  title: "Back",
                  isLoading: false,
                  onTap: () {
                    Get.back();
                  }),
            ),
          ]),
    ));
  }
}
