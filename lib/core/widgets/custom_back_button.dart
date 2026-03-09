import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kScaffoldBackgroundColor,
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
