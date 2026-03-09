import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

void customSnackBar(
  BuildContext context,
  String errorMessage, {
  Color backgroundColor = AppColors.kErrorColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(
        title: errorMessage,
        style: AppTextStyle.font14WhiteBold,
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
