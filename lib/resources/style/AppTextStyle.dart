import 'package:flutter/material.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';
import 'package:get/get.dart';

class AppTextStyle {
  static TextStyle subtext = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Get.height * 0.03,
    color: AppColors.grey700Color,
  );
  static TextStyle largeHeading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: Get.height * 0.04,
    color: AppColors.blackColor,
  );
  static TextStyle categoryCard = TextStyle(
    fontSize: Get.height * 0.02,
    fontWeight: FontWeight.w400,
    color: AppColors.categoryTextColor,
  );
  static TextStyle headingCard = TextStyle(
    fontSize: Get.height * 0.03,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static TextStyle caloriesCard = TextStyle(
    fontSize: Get.height * 0.02,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.7),
  );
  static TextStyle timeCard = TextStyle(
    fontSize: Get.height * 0.015,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
}
