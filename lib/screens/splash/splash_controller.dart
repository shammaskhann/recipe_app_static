import 'package:food_recipe_app/resources/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RouteName.homeScreen);
    });
  }
}
