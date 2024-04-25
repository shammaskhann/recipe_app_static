import 'package:flutter/material.dart';
import 'package:food_recipe_app/resources/color/AppColors.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final bool isLoading;
  final Function()? onTap;
  const CustomButton(
      {required this.height,
      required this.width,
      required this.title,
      required this.isLoading,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.whiteColor),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
