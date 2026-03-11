import 'package:flutter/material.dart';
import 'package:food_app/core/helper/spacer.dart';
import 'package:food_app/core/style/colors/app_colors.dart';
import 'package:food_app/core/style/fonts/app_text_style.dart';
import 'package:food_app/core/widgets/custom_text.dart';

class CustomTitleDetails extends StatelessWidget {
  const CustomTitleDetails({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: "Ingredients", style: AppTextStyle.font24BlackW700),
        Divider(
          color: AppColors.kPrimaryColor,
          indent: deviceWidth * 0.05,
          endIndent: deviceWidth * 0.7,
          thickness: 3,
          height: deviceHeight * 0.01,
        ),
        heightSpace(deviceHeight * 0.01),
      ],
    );
  }
}
