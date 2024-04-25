import 'package:food_recipe_app/resources/routes/routes_name.dart';
import 'package:food_recipe_app/screens/detail_screen/detail_recipe_screen.dart';
import 'package:food_recipe_app/screens/home_screen/home_screen.dart';
import 'package:food_recipe_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppRoutes {
  static List<GetPage> appRoute() {
    return [
      GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.homeScreen,
          page: (() => const HomeScreen()),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 1000)),
      GetPage(
          name: RouteName.detailRecipeScreen,
          arguments: Get.arguments,
          page: (() => DetailRecipeScreen(recipe: Get.arguments)),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 1000)),
    ];
  }
}
