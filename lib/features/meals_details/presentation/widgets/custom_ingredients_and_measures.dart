import 'package:flutter/material.dart';
import 'package:food_app/core/constants/api_constants.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomIngredientsAndMeasures extends StatelessWidget {
  const CustomIngredientsAndMeasures({
    super.key,
    required this.measure,
    required this.ingredient,
    required this.imageUrl,
  });
  final String measure, ingredient, imageUrl;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return measure == "" || ingredient == ""
        ? const SizedBox.shrink()
        : Container(
            margin: EdgeInsets.only(bottom: deviceHeight * 0.01),
            padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryLightColor.withAlpha(50),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "${ApiConstants.imagesBaseUrl}/$imageUrl.png",
                  height: deviceHeight * 0.07,
                  width: deviceHeight * 0.05,
                  fit: BoxFit.contain,
                ),
                widthSpace(deviceWidth * 0.02),
                CustomText(
                  title: "$measure $ingredient",
                  style: AppTextStyle.font14BlackBold,
                ),
              ],
            ),
          );
  }
}
