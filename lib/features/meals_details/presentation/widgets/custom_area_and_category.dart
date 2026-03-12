import 'package:flutter/material.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomAreaAndCategory extends StatelessWidget {
  const CustomAreaAndCategory({
    super.key,
    required this.area,
    required this.category,
    this.style,
  });
  final String area, category;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        Container(
          height: deviceHeight * 0.05,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 5, right: 10),
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryLightColor.withAlpha(50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomText(
            title: area.toUpperCase(),
            style: style ?? AppTextStyle.font14PrimaryBold,
          ),
        ),
        Container(
          height: deviceHeight * 0.05,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 5, right: 10),
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryLightColor.withAlpha(50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: CustomText(
            title: category.toUpperCase(),
            style: style ?? AppTextStyle.font14PrimaryBold,
          ),
        ),
      ],
    );
  }
}
