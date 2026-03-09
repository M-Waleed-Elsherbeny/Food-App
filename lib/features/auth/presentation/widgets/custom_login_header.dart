import 'package:flutter/material.dart';
import 'package:food_app/core/assets/app_assets.dart';
import 'package:food_app/core/style/colors/app_colors.dart';

class CustomLoginHeader extends StatelessWidget {
  const CustomLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: deviceWidth * 0.97,
      height: deviceHeight * 0.25,
      decoration: BoxDecoration(
        color: AppColors.kScaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      alignment: Alignment.center,
      child: Image.asset(AppAssets.foodLogo, fit: BoxFit.cover),
    );
  }
}
