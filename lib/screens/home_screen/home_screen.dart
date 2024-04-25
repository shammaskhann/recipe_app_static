import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/Favourite%20Controller/favourite_controller.dart';
import 'package:food_recipe_app/models/recipe_model.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:food_recipe_app/resources/icons/AppIcon.dart';
import 'package:food_recipe_app/resources/routes/routes_name.dart';
import 'package:food_recipe_app/resources/style/AppTextStyle.dart';
import 'package:food_recipe_app/screens/home_screen/home_screen_controller.dart';
import 'package:food_recipe_app/screens/widgets/ItemCard.dart';
import 'package:food_recipe_app/screens/widgets/ItemCard2.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    FavouriteController favController = Get.put(FavouriteController());
    List<ItemCard2> recommendedItems = [];
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Hamburger Menu & Notification Icon
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset(
                      AppIcons.hamburgerIcon,
                      height: Get.height * 0.03,
                      width: Get.height * 0.03,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none_sharp,
                      color: AppColors.blackColor,
                      size: Get.height * 0.03,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            //Name & Tagline
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ronjor Emma",
                      style: AppTextStyle.subtext
                          .copyWith(fontSize: Get.height * 0.03)),
                  Text(
                    "What would you like to cook \n today?",
                    style: AppTextStyle.largeHeading.copyWith(
                      fontSize: Get.height * 0.03,
                    ),
                  ),
                ],
              ),
            ),
            //SearchBar & Filer Icon
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.78,
                    decoration: BoxDecoration(
                      color: AppColors.tileColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          // const Padding(
                          //   padding: EdgeInsets.only(top: 5.0),
                          //   child: Icon(
                          //     Icons.search,
                          //     color: AppColors.grey700Color,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showSearch(
                                    context: context,
                                    delegate: RecipeSearchDelegate(
                                        controller.recipes));
                              },
                              child: Container(
                                height: Get.height * 0.06,
                                width: Get.width * 0.78,
                                decoration: BoxDecoration(
                                  color: AppColors.tileColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.search,
                                        color: AppColors.grey700Color,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Search for recipes",
                                        style: AppTextStyle.subtext.copyWith(
                                          color: AppColors.grey700Color,
                                          fontSize: Get.height * 0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // child: TextField(
                            //   onTap: () {
                            //     showSearch(
                            //         context: context,
                            //         delegate: RecipeSearchDelegate(
                            //             controller.recipes));
                            //   },
                            //   decoration: InputDecoration(
                            //     alignLabelWithHint: true,
                            //     hintText: "Search for recipes",
                            //     hintStyle: AppTextStyle.subtext.copyWith(
                            //       color: AppColors.grey700Color,
                            //       fontSize: Get.height * 0.02,
                            //     ),
                            //     border: InputBorder.none,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.12,
                      decoration: BoxDecoration(
                        color: AppColors.tileColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.filter_list,
                        color: AppColors.blackColor,
                        size: Get.height * 0.03,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            //Todays Fresh recipes
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Fresh Recipes",
                        style: AppTextStyle.largeHeading.copyWith(
                          fontSize: Get.height * 0.03,
                        ),
                      ),
                      Text(
                        "See All",
                        style: AppTextStyle.subtext.copyWith(
                          fontSize: Get.height * 0.02,
                          fontWeight: FontWeight.w300,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: Get.height * 0.25,
                    width: Get.width,
                    child: FutureBuilder<List<Recipe>>(
                        future: controller.getFreshRecipes(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return const Center(child: Text("Error"));
                          }
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return ItemCard(
                                      recipe: snapshot.data![index]);
                                });
                          }
                          return const Center(child: Text("No Data"));
                        }),
                  )
                ],
              ),
            ),
            //Recommended Recipes
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recomeded Recipes",
                        style: AppTextStyle.largeHeading.copyWith(
                          fontSize: Get.height * 0.03,
                        ),
                      ),
                      Text(
                        "See All",
                        style: AppTextStyle.subtext.copyWith(
                          fontSize: Get.height * 0.02,
                          fontWeight: FontWeight.w300,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<List<Recipe>>(
                    future: controller.getRecommendedRecipes(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(child: Text("Error"));
                      }
                      if (snapshot.hasData) {
                        for (var recipe in snapshot.data!) {
                          recommendedItems.add(ItemCard2(recipe: recipe));
                        }
                        return Column(
                          children: recommendedItems,
                        );
                      }
                      return const Center(child: Text("No Data"));
                    },
                  )
                ],
              ),
            ),
          ]),
    ));
  }
}

class RecipeSearchDelegate extends SearchDelegate<Recipe> {
  final List<Recipe> recipes;

  RecipeSearchDelegate(this.recipes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Recipe());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can also implement a method to build the results page
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recipes
        : recipes
            .where((recipe) =>
                recipe.recipeName!.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final recipe = suggestions[index];
        return ListTile(
          title: Text(recipe.recipeName ?? 'Recipe Name'),
          onTap: () {
            close(context, recipe);
            Get.toNamed(RouteName.detailRecipeScreen, arguments: recipe);
            // ignore: use_build_context_synchronously
          },
        );
      },
    );
  }
}
