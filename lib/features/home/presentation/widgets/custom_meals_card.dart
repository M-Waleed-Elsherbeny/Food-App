import 'package:flutter/material.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomMealsCard extends StatelessWidget {
  const CustomMealsCard({super.key, required this.title, required this.image});
  final String title, image;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.kPrimaryColor,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(image, width: deviceWidth),
          ),
          heightSpace(deviceHeight * 0.01),
          Padding(
            padding: EdgeInsets.only(
              right: deviceHeight * 0.01,
              left: deviceWidth * 0.02,
            ),
            child: CustomText(
              title: title,
              style: AppTextStyle.font16WhiteNormal.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
