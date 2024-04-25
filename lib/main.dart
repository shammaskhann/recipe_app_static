import 'package:flutter/material.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:food_recipe_app/resources/routes/routes.dart';
import 'package:food_recipe_app/screens/home_screen/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoute(),
      theme: ThemeData(
        fontFamily: 'Hellix',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
    );
  }
}
