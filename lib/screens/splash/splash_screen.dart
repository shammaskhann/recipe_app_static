import 'package:flutter/material.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:food_recipe_app/resources/icons/AppIcon.dart';
import 'package:food_recipe_app/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      body: Center(child: Image.asset(AppIcons.splashIcon)),
      backgroundColor: AppColors.primaryColor.withOpacity(0.8),
    );
  }
}
