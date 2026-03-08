import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';

void customSnackBar(BuildContext context, String errorMessage,
    {Color backgroundColor = AppColors.kErrorColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(errorMessage), backgroundColor: backgroundColor),
  );
}
